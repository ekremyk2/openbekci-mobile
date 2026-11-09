import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/cache/cached.dart';

class TicketsRepository {
  const new(this.api);

  final ApiClient api;

  Future<List<Ticket>> list({required String orgId, required String siteId}) =>
      fetchPages<Ticket>((cursor) async {
        final page = await unwrap(
          () => api.operations.operationsListTickets(
            orgId: orgId,
            siteId: siteId,
            cursor: cursor,
          ),
        );
        return (items: page.items, next: page.nextCursor);
      });

  Future<List<TicketCategory>> categories({
    required String orgId,
    required String siteId,
  }) => fetchPages<TicketCategory>((cursor) async {
    final page = await unwrap(
      () => api.operations.operationsListTicketCategories(
        orgId: orgId,
        siteId: siteId,
        cursor: cursor,
      ),
    );
    return (items: page.items, next: page.nextCursor);
  });

  Future<TicketWorkflow> workflow({
    required String orgId,
    required String siteId,
  }) => unwrap(
    () => api.operations.operationsGetTicketWorkflow(
      orgId: orgId,
      siteId: siteId,
    ),
  );

  Future<Ticket> get({required String orgId, required String ticketId}) =>
      unwrap(
        () => api.operations.operationsGetTicket(
          orgId: orgId,
          ticketId: ticketId,
        ),
      );

  Future<List<TicketComment>> comments({
    required String orgId,
    required String ticketId,
  }) => fetchPages<TicketComment>((cursor) async {
    final page = await unwrap(
      () => api.operations.operationsListTicketComments(
        orgId: orgId,
        ticketId: ticketId,
        cursor: cursor,
      ),
    );
    return (items: page.items, next: page.nextCursor);
  });

  Future<List<TicketStatusChange>> history({
    required String orgId,
    required String ticketId,
  }) => fetchPages<TicketStatusChange>((cursor) async {
    final page = await unwrap(
      () => api.operations.operationsListTicketHistory(
        orgId: orgId,
        ticketId: ticketId,
        cursor: cursor,
      ),
    );
    return (items: page.items, next: page.nextCursor);
  });

  Future<Ticket> create({
    required String orgId,
    required TicketCreate body,
    required String idempotencyKey,
  }) => unwrap(
    () => api.operations.operationsCreateTicket(
      orgId: orgId,
      ticketCreate: body,
      idempotencyKey: idempotencyKey,
    ),
  );

  Future<TicketComment> comment({
    required String orgId,
    required String ticketId,
    required String body,
    required String idempotencyKey,
  }) => unwrap(
    () => api.operations.operationsCreateTicketComment(
      orgId: orgId,
      ticketId: ticketId,
      idempotencyKey: idempotencyKey,
      ticketCommentCreate: TicketCommentCreate(
        body: body,
        visibility: TicketCommentCreateVisibilityEnum.public,
      ),
    ),
  );

  /// "+1" ([vote] true) or take it back.
  Future<TicketVote> vote({
    required String orgId,
    required String ticketId,
    required bool vote,
  }) => unwrap(
    () => vote
        ? api.operations.operationsVoteTicket(orgId: orgId, ticketId: ticketId)
        : api.operations.operationsUnvoteTicket(
            orgId: orgId,
            ticketId: ticketId,
          ),
  );
}
