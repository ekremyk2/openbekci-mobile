import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/org/org_context.dart';
import 'package:openbekci_mobile/core/widgets/cached_view.dart';
import 'package:openbekci_mobile/core/widgets/display.dart';
import 'package:openbekci_mobile/core/widgets/resident_widgets.dart';
import 'package:openbekci_mobile/features/community/application/community_providers.dart';
import 'package:openbekci_mobile/features/community/domain/visitors_logic.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// Parcels the guard logged for the person's unit(s): waiting first, then the
/// recently collected (C3).
class ParcelsScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    final now = ref.watch(nowProvider)();
    final timezone = ctx?.timezone ?? 'UTC';
    return Scaffold(
      appBar: AppBar(title: Text(l.parcelsTitle)),
      body: CachedView<List<Delivery>>(
        provider: parcelsProvider,
        isEmpty: (list) => list.isEmpty,
        emptyIcon: Icons.inventory_2_outlined,
        emptyMessage: l.parcelsEmpty,
        builder: (context, list) {
          final waiting = waitingParcels(list);
          final recent = recentParcels(list, now);
          return [
            SectionTitle(
              l.parcelsWaiting,
              trailing: CountBadge(waiting.length),
            ),
            if (waiting.isEmpty)
              Text(l.parcelsNoneWaiting, key: const Key('noneWaiting'))
            else
              for (final d in waiting)
                Card(
                  key: Key('parcel_${d.id}'),
                  child: ListTile(
                    leading: const Icon(Icons.inventory_2_outlined),
                    title: Text(
                      d.description?.isNotEmpty ?? false
                          ? d.description!
                          : l.parcelNoDescription,
                    ),
                    subtitle: Wrap(
                      spacing: 8,
                      children: [
                        Text(l.parcelUnit(d.unitDoorNumber)),
                        Text(l.parcelReceived),
                        SiteDate(
                          instant: d.receivedAt,
                          timezone: timezone,
                          withTime: true,
                        ),
                      ],
                    ),
                  ),
                ),
            if (recent.isNotEmpty) ...[
              SectionTitle(l.parcelsRecent),
              for (final d in recent)
                Card(
                  key: Key('parcel_${d.id}'),
                  child: ListTile(
                    leading: const Icon(Icons.check_circle_outline),
                    title: Text(
                      d.description?.isNotEmpty ?? false
                          ? d.description!
                          : l.parcelNoDescription,
                    ),
                    subtitle: Wrap(
                      spacing: 8,
                      children: [
                        Text(l.parcelUnit(d.unitDoorNumber)),
                        Text(l.parcelCollected),
                        SiteDate(
                          instant: d.collectedAt ?? d.receivedAt,
                          timezone: timezone,
                          withTime: true,
                        ),
                        if (d.collectedByName != null)
                          Text(l.parcelCollectedBy(d.collectedByName!)),
                      ],
                    ),
                  ),
                ),
            ],
          ];
        },
      ),
    );
  }
}
