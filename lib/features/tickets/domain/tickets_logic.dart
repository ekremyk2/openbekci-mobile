import 'package:openbekci_api/openbekci_api.dart' hide Notification;

/// Statuses are per-site workflows: the app shows `status_name` as served and
/// groups only by the `open_like` / `closed_like` semantic (O1). A semantic
/// the app does not know counts as open (never hides a ticket).
bool isClosedTicket(Ticket t) => t.statusSemantic == TicketSemantic.closedLike;

/// Same for a workflow status.
bool isClosedStatus(TicketStatus s) =>
    s.semantic == TicketStatusSemanticEnum.closedLike;

/// Filter chips of the ticket list.
enum TicketScope { all, mine, common }

/// Tickets visible under [scope]. "Mine" are the ones I reported; "common"
/// are the site's shared tickets (O3).
List<Ticket> filterTickets(
  List<Ticket> tickets,
  TicketScope scope, {
  required String? myPersonId,
}) {
  switch (scope) {
    case TicketScope.all:
      return tickets;
    case TicketScope.mine:
      return [
        for (final t in tickets)
          if (t.reporterPersonId == myPersonId) t,
      ];
    case TicketScope.common:
      return [
        for (final t in tickets)
          if (t.visibility == TicketVisibilityEnum.common) t,
      ];
  }
}

/// Open tickets first (newest activity first), then closed ones.
({List<Ticket> open, List<Ticket> closed}) groupTickets(List<Ticket> tickets) {
  int byUpdated(Ticket a, Ticket b) => b.updatedAt.compareTo(a.updatedAt);
  final open = [
    for (final t in tickets)
      if (!isClosedTicket(t)) t,
  ]..sort(byUpdated);
  final closed = [
    for (final t in tickets)
      if (isClosedTicket(t)) t,
  ]..sort(byUpdated);
  return (open: open, closed: closed);
}

/// One entry of a ticket's thread: a status change or a public comment.
class TimelineEntry {
  const new status(TicketStatusChange this.change) : comment = null;
  const new comment(TicketComment this.comment) : change = null;

  final TicketStatusChange? change;
  final TicketComment? comment;

  DateTime get at => change?.at ?? comment!.createdAt;
}

/// The thread, oldest first: status history merged with the **public**
/// comments (internal notes are never shown to residents, even if served).
List<TimelineEntry> buildTimeline(
  List<TicketStatusChange> history,
  List<TicketComment> comments,
) {
  final entries = <TimelineEntry>[
    for (final h in history) TimelineEntry.status(h),
    for (final c in comments)
      if (c.visibility != TicketCommentVisibilityEnum.internal)
        TimelineEntry.comment(c),
  ]..sort((a, b) => a.at.compareTo(b.at));
  return entries;
}

/// The "+1" only exists on common tickets that are not merged or closed.
bool canVote(Ticket t) =>
    t.visibility == TicketVisibilityEnum.common &&
    t.mergedIntoId == null &&
    !isClosedTicket(t);

/// Maximum photos on one ticket.
const maxTicketPhotos = 10;
