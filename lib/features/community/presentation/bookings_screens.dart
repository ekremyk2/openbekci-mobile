import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/l10n/codes.dart';
import 'package:openbekci_mobile/core/l10n/format.dart';
import 'package:openbekci_mobile/core/org/org_context.dart';
import 'package:openbekci_mobile/core/widgets/cached_view.dart';
import 'package:openbekci_mobile/core/widgets/display.dart';
import 'package:openbekci_mobile/core/widgets/form_support.dart';
import 'package:openbekci_mobile/core/widgets/resident_widgets.dart';
import 'package:openbekci_mobile/core/widgets/states.dart';
import 'package:openbekci_mobile/features/community/application/community_providers.dart';
import 'package:openbekci_mobile/features/community/domain/booking_logic.dart';
import 'package:openbekci_mobile/features/community/presentation/booking_widgets.dart';
import 'package:openbekci_mobile/features/push/application/web_link.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// Facilities with their rules, and my bookings (C1).
class BookingsScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l.bookingsTitle),
          bottom: TabBar(
            tabs: [
              Tab(key: const Key('tabFacilities'), text: l.bookingsFacilities),
              Tab(key: const Key('tabMyBookings'), text: l.bookingsMine),
            ],
          ),
        ),
        body: const TabBarView(children: [_FacilitiesTab(), _MyBookingsTab()]),
      ),
    );
  }
}

class _FacilitiesTab extends ConsumerWidget {
  const new();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final ctx = ref.watch(orgContextProvider);
    return CachedView<List<Facility>>(
      provider: facilitiesProvider,
      isEmpty: (list) => list.isEmpty,
      emptyIcon: Icons.event_available_outlined,
      emptyMessage: l.facilitiesEmpty,
      builder: (context, list) => [
        for (final f in list)
          Card(
            key: Key('facility_${f.id}'),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => context.push('/more/bookings/facility/${f.id}'),
              child: Padding(
                padding: const EdgeInsetsDirectional.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            f.name,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        _FeePill(fee: f.rules.fee),
                      ],
                    ),
                    if (f.description?.isNotEmpty ?? false)
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 4),
                        child: Text(f.description!),
                      ),
                    const SizedBox(height: 8),
                    for (final line in ruleLines(l, f.rules, locale: locale))
                      Text(line, style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 8),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: FilledButton.tonal(
                        key: Key('book_${f.id}'),
                        onPressed: () =>
                            context.push('/more/bookings/facility/${f.id}'),
                        child: Text(l.bookingBook),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (ctx != null) const OpenInWebTile(tail: '/bookings'),
      ],
    );
  }
}

class _FeePill extends StatelessWidget {
  const new({required this.fee});

  final Money? fee;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final f = fee;
    if (f == null || f.amount <= 0) return Pill(l.feeFree, tone: PillTone.good);
    return Pill(
      formatMoney(
        f.amount,
        f.currency,
        locale: Localizations.localeOf(context).toLanguageTag(),
      ),
      tone: PillTone.warn,
    );
  }
}

class _MyBookingsTab extends ConsumerWidget {
  const new();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    final now = ref.watch(nowProvider)();
    return CachedView<List<Booking>>(
      provider: myBookingsProvider,
      isEmpty: (list) => list.isEmpty,
      emptyIcon: Icons.event_busy_outlined,
      emptyMessage: l.bookingsEmpty,
      builder: (context, list) => [
        for (final b in sortBookings(list, now))
          Card(
            key: Key('booking_${b.id}'),
            child: ListTile(
              leading: const Icon(Icons.event_available_outlined),
              title: Text(b.facilityName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SiteRange(
                    start: b.start,
                    end: b.end,
                    timezone: ctx?.timezone ?? 'UTC',
                  ),
                  Wrap(
                    spacing: 8,
                    children: [
                      Pill(
                        b.status == BookingStatusEnum.confirmed
                            ? l.bookingConfirmed
                            : b.status == BookingStatusEnum.cancelled
                            ? l.bookingCancelled
                            : l.valueOther,
                        tone: b.status == BookingStatusEnum.confirmed
                            ? PillTone.good
                            : PillTone.neutral,
                      ),
                      if (b.fee != null && b.fee!.amount > 0)
                        MoneyText(
                          amountMinor: b.fee!.amount,
                          currency: b.fee!.currency,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      if (b.refund != null && b.refund!.amount > 0)
                        Text(
                          l.bookingRefunded,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                    ],
                  ),
                  if (b.status == BookingStatusEnum.confirmed &&
                      b.end.isAfter(now))
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: TextButton(
                        key: Key('cancel_${b.id}'),
                        onPressed: () => _confirmCancel(context, ref, b),
                        child: Text(l.actionCancelBooking),
                      ),
                    ),
                ],
              ),
              isThreeLine: true,
            ),
          ),
      ],
    );
  }

  Future<void> _confirmCancel(
    BuildContext context,
    WidgetRef ref,
    Booking booking,
  ) async {
    final l = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final facilities = ref.read(facilitiesProvider).value?.data ?? const [];
    final facility = facilities
        .where((f) => f.id == booking.facilityId)
        .firstOrNull;
    final outcome = cancelOutcome(
      booking: booking,
      cutoffHours: facility?.rules.cancelRefundCutoffHours,
      now: ref.read(nowProvider)(),
    );
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l.cancelBookingTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(booking.facilityName),
            const SizedBox(height: 8),
            Text(
              key: const Key('refundRule'),
              refundRuleText(
                l,
                fee: outcome.fee,
                refunded: outcome.refunded,
                until: outcome.until,
                timezone: ref.read(orgContextProvider)?.timezone ?? 'UTC',
                locale: Localizations.localeOf(context).toLanguageTag(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(false),
            child: Text(l.actionKeepBooking),
          ),
          FilledButton(
            key: const Key('confirmCancel'),
            onPressed: () => context.pop(true),
            child: Text(l.actionCancelBooking),
          ),
        ],
      ),
    );
    if (ok != true) return;
    try {
      await cancelBooking(ref, booking);
      messenger.showSnackBar(SnackBar(content: Text(l.bookingCancelledDone)));
    } on Object catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text(errorMessage(l, AppError.from(e)))),
      );
    }
  }
}

/// The refund rule in a sentence: no fee, fee returned (until when), or fee
/// kept.
String refundRuleText(
  AppLocalizations l, {
  required Money? fee,
  required bool refunded,
  required DateTime? until,
  required String timezone,
  required String locale,
}) {
  if (fee == null) return l.refundNoFee;
  final amount = formatMoney(fee.amount, fee.currency, locale: locale);
  if (refunded) return l.refundGiven(amount);
  if (until == null) return l.refundNever(amount);
  return l.refundKept(
    amount,
    formatSiteDate(until, timezone: timezone, locale: locale, withTime: true),
  );
}

/// One facility: its rules, the slot picker, the fee preview and the
/// confirmation (instant, with an `Idempotency-Key`).
class FacilityScreen extends ConsumerStatefulWidget {
  const new({
    required this.facilityId,
    this.initialDuration,
    this.initialStart,
    super.key,
  });

  final String facilityId;

  /// Preselected duration in minutes and start instant (a deep link to a
  /// slot, and the screenshots of the picker).
  final int? initialDuration;
  final DateTime? initialStart;

  @override
  ConsumerState<FacilityScreen> createState() => _FacilityState();
}

class _FacilityState extends ConsumerState<FacilityScreen> with SubmitState {
  SiteDay? _day;
  int? _duration;
  DateTime? _start;
  String? _unitId;

  @override
  void initState() {
    super.initState();
    _duration = widget.initialDuration;
    _start = widget.initialStart;
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final async = ref.watch(facilitiesProvider);
    final facility = async.value?.data
        ?.where((f) => f.id == widget.facilityId)
        .firstOrNull;
    final ctx = ref.watch(orgContextProvider);
    if (facility == null || ctx == null) {
      final err = async.value?.error;
      return Scaffold(
        appBar: AppBar(title: Text(l.bookingsTitle)),
        body: err != null
            ? ErrorState(
                error: err,
                onRetry: () => ref.invalidate(facilitiesProvider),
              )
            : (async.value?.data != null
                  ? EmptyState(message: l.facilityNotFound)
                  : const SkeletonList()),
      );
    }
    final rules = facility.rules;
    final units = ref.watch(residentUnitsProvider);
    final unit =
        units.where((u) => u.unitId == _unitId).firstOrNull ??
        (units.isEmpty ? null : units.first);
    final now = ref.watch(nowProvider)();
    final days = bookableDays(rules: rules, now: now, timezone: ctx.timezone);
    final day = _day ?? (days.isEmpty ? null : days.first);
    final durations = durationChoices(rules);
    final duration = _duration ?? (durations.isEmpty ? null : durations.first);

    Availability? availability;
    if (day != null) {
      final from = siteInstant(ctx.timezone, day.year, day.month, day.day);
      final next = addDays(day, 1);
      final to = siteInstant(ctx.timezone, next.year, next.month, next.day);
      final av = ref.watch(
        availabilityProvider((facilityId: facility.id, from: from, to: to)),
      );
      availability = av.value;
    }
    final mine = ref.watch(myBookingsProvider).value?.data ?? const [];
    final slots = (day == null || duration == null)
        ? const <({DateTime start, BookingProblem? problem})>[]
        : startTimes(
            rules: rules,
            day: day,
            duration: duration,
            now: now,
            timezone: ctx.timezone,
            availability: availability,
            role: unit?.role,
            quotaAlreadyUsed: unit == null
                ? 0
                : quotaUsed(
                    mine: mine,
                    rules: rules,
                    facilityId: facility.id,
                    unitId: unit.unitId,
                    start: siteInstant(
                      ctx.timezone,
                      day.year,
                      day.month,
                      day.day,
                      hour: 12,
                    ),
                    timezone: ctx.timezone,
                  ),
          );
    final start = _start != null && slots.any((s) => s.start == _start)
        ? _start
        : null;
    final end = (start == null || duration == null)
        ? null
        : start.add(Duration(minutes: duration));
    final quote = start == null ? null : BookingQuote.fromRules(rules, start);

    return FormPage(
      title: facility.name,
      children: [
        if (facility.description?.isNotEmpty ?? false)
          Text(facility.description!),
        const SizedBox(height: 8),
        for (final line in ruleLines(l, rules, locale: locale))
          Text(line, style: Theme.of(context).textTheme.bodySmall),
        if (units.length > 1) ...[
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            key: const Key('unitPicker'),
            initialValue: unit?.unitId,
            decoration: InputDecoration(labelText: l.bookingUnit),
            items: [
              for (final u in units)
                DropdownMenuItem(value: u.unitId, child: Text(u.label)),
            ],
            onChanged: (v) => setState(() {
              _unitId = v;
              _start = null;
            }),
          ),
        ],
        SectionTitle(l.bookingPickDay),
        if (days.isEmpty)
          Text(l.bookingNoDays)
        else
          SizedBox(
            height: 56,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final d in days)
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 8),
                      child: ChoiceChip(
                        key: Key('day_${d.year}-${d.month}-${d.day}'),
                        label: Text(
                          formatSiteDay(
                            siteInstant(
                              ctx.timezone,
                              d.year,
                              d.month,
                              d.day,
                              hour: 12,
                            ),
                            timezone: ctx.timezone,
                            locale: locale,
                          ),
                        ),
                        selected: d == day,
                        onSelected: (_) => setState(() {
                          _day = d;
                          _start = null;
                        }),
                      ),
                    ),
                ],
              ),
            ),
          ),
        if (durations.isNotEmpty) ...[
          SectionTitle(l.bookingDuration),
          Wrap(
            spacing: 8,
            children: [
              for (final m in durations)
                ChoiceChip(
                  key: Key('duration_$m'),
                  label: Text(durationLabel(l, m)),
                  selected: m == duration,
                  onSelected: (_) => setState(() {
                    _duration = m;
                    _start = null;
                  }),
                ),
            ],
          ),
        ],
        SectionTitle(l.bookingPickTime),
        if (slots.isEmpty)
          Text(l.bookingNoSlots)
        else
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              for (final s in slots)
                Tooltip(
                  message: s.problem == null
                      ? ''
                      : bookingProblemText(l, s.problem!),
                  child: ChoiceChip(
                    key: Key('slot_${s.start.toUtc().toIso8601String()}'),
                    label: Text(
                      formatSiteTime(
                        s.start,
                        timezone: ctx.timezone,
                        locale: locale,
                      ),
                    ),
                    selected: s.start == start,
                    onSelected: s.problem == null
                        ? (_) => setState(() => _start = s.start)
                        : null,
                  ),
                ),
            ],
          ),
        if (slots.isNotEmpty && slots.every((s) => s.problem != null))
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 8),
            child: Text(
              key: const Key('noFreeSlot'),
              bookingProblemText(l, slots.first.problem!),
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        if (start != null && end != null && quote != null) ...[
          SectionTitle(l.bookingSummary),
          Card(
            key: const Key('feePreview'),
            child: Padding(
              padding: const EdgeInsetsDirectional.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SiteRange(
                    start: start,
                    end: end,
                    timezone: ctx.timezone,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  if (quote.hasFee)
                    Row(
                      children: [
                        Expanded(child: Text(l.bookingFee)),
                        MoneyText(
                          amountMinor: quote.fee!.amount,
                          currency: quote.fee!.currency,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    )
                  else
                    Text(l.bookingNoFee),
                  const SizedBox(height: 4),
                  Text(
                    key: const Key('previewRefundRule'),
                    refundRuleText(
                      l,
                      fee: quote.fee,
                      refunded: quote.refundableAt(now),
                      until: quote.refundableUntil,
                      timezone: ctx.timezone,
                      locale: locale,
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ],
        const SizedBox(height: 16),
        if (error != null) ErrorBanner(error: error!),
        const SizedBox(height: 8),
        FilledButton(
          key: const Key('confirmBooking'),
          onPressed: busy || start == null || end == null || unit == null
              ? null
              : () =>
                    submit(() async {
                      await createBooking(
                        ref,
                        facility: facility,
                        unitId: unit.unitId,
                        start: start,
                        end: end,
                      );
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(l.bookingConfirmedDone)),
                      );
                      context.pop();
                    }).whenComplete(() {
                      // A taken slot changed the picture: show the real one.
                      ref.invalidate(availabilityProvider);
                    }),
          child: busy
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(l.bookingConfirm),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 8),
          child: Text(
            l.bookingNeedsConnection,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
