import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_mobile/core/cache/cache_policy.dart';
import 'package:openbekci_mobile/core/cache/cached.dart';
import 'package:openbekci_mobile/core/widgets/display.dart';
import 'package:openbekci_mobile/core/widgets/states.dart';

/// A pull-to-refresh list over a stale-while-revalidate [provider]: skeleton
/// while the first load runs, the cached data at once with a subtle offline
/// banner when the refresh cannot reach the server, the shared error state
/// when there is nothing to show, and the shared empty state.
class CachedView<T> extends ConsumerWidget {
  const new({
    required this.provider,
    required this.builder,
    this.isEmpty,
    this.emptyMessage,
    this.emptyTitle,
    this.emptyIcon,
    this.padding = const EdgeInsetsDirectional.all(16),
    this.header,
    super.key,
  });

  final StreamProvider<CacheState<T>> provider;

  /// The rows of the list for the loaded data.
  final List<Widget> Function(BuildContext context, T data) builder;
  final bool Function(T data)? isEmpty;
  final String? emptyMessage;
  final String? emptyTitle;
  final IconData? emptyIcon;
  final EdgeInsetsGeometry padding;

  /// Shown above the rows, once data exists.
  final Widget? header;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(provider);
    final state = async.value;
    final data = state?.data;
    if (data == null) {
      final error = state?.error;
      if (error != null) {
        return ErrorState(
          error: error,
          onRetry: () => ref.invalidate(provider),
        );
      }
      return const SkeletonList();
    }
    final empty = isEmpty?.call(data) ?? false;
    return RefreshIndicator(
      onRefresh: () => refreshCached(ref, provider),
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          if (state!.isOffline) const OfflineBanner(),
          ?header,
          if (empty)
            SizedBox(
              height: 320,
              child: EmptyState(
                title: emptyTitle,
                message: emptyMessage ?? '',
                icon: emptyIcon,
              ),
            )
          else
            Padding(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: builder(context, data),
              ),
            ),
        ],
      ),
    );
  }
}
