import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_api/openbekci_api.dart' hide File, Notification;

import '../support/fixtures.dart';

/// The resident core against the contract: unknown values of the open enums
/// the screens read decode to the unknown case instead of throwing, the
/// discriminated debtor key decodes in both modes, and the bodies the app
/// sends have the shapes the server expects.
void main() {
  test('every enum the resident screens read has an unknown case', () {
    final statement = Statement.fromJson({
      ...statementJson(),
      'lines': [
        {...statementLineJson(), 'kind': 'brand_new', 'debtor_kind': 'x'},
      ],
    });
    expect(
      statement.lines.single.kind,
      StatementLineKindEnum.unknownDefaultOpenApi,
    );

    final payment = Payment.fromJson({
      ...paymentJson(),
      'status': 'weird',
      'method': 'crypto',
      'debtor_kind': 'landlord',
    });
    expect(payment.status, PaymentStatusEnum.unknownDefaultOpenApi);
    expect(payment.method, 'crypto');

    final ticket = Ticket.fromJson({
      ...ticketJson(),
      'visibility': 'secret',
      'status_semantic': 'sideways_like',
    });
    expect(ticket.visibility, TicketVisibilityEnum.unknownDefaultOpenApi);
    expect(ticket.statusSemantic, TicketSemantic.unknownDefaultOpenApi);

    final status = TicketStatus.fromJson({
      'id': 'a',
      'name': 'Parked',
      'semantic': 'sideways_like',
      'position': 1,
      'key': null,
    });
    expect(status.semantic, TicketStatusSemanticEnum.unknownDefaultOpenApi);
    expect(status.name, 'Parked');

    final announcement = Announcement.fromJson({
      ...announcementJson(),
      'status': 'vaporized',
      'channels': ['in_app', 'telepathy'],
    });
    expect(announcement.status, AnnouncementStatusEnum.unknownDefaultOpenApi);

    final side = MySide.fromJson(sideJson(kind: 'landlord'));
    expect(side.debtorKind, MySideDebtorKindEnum.unknownDefaultOpenApi);

    final session = Session.fromJson({
      'id': 's',
      'client': 'toaster',
      'device_name': null,
      'ip': null,
      'user_agent': null,
      'created_at': '2026-11-01T00:00:00Z',
      'last_used_at': null,
      'expires_at': '2027-01-01T00:00:00Z',
      'current': false,
    });
    expect(session.client, SessionClientEnum.unknownDefaultOpenApi);
  });

  test('a whole dashboard with unknown values still decodes', () {
    final d = MeDashboard.fromJson({
      ...dashboardJson(),
      'home': 'galaxy',
      'sides': [sideJson(kind: 'martian')],
    });
    expect(d.sides.single.total.amount, 150000);
  });

  test('statement debtor decodes in both modes', () {
    final unitSide = Statement.fromJson(statementJson());
    expect(unitSide.debtor.mode, DebtorRefModeEnum.unitSide);
    expect(unitSide.debtor.unitId, unit12);
    final person = Statement.fromJson({
      ...statementJson(),
      'debtor': {'mode': 'person', 'person_id': personId},
    });
    expect(person.debtor.mode, DebtorRefModeEnum.person);
    expect(person.debtor.personId, personId);
    expect(person.debtor.unitId, isNull);
  });

  test('the declaration serializes as the server expects', () {
    final body = PaymentDeclare(
      siteId: siteId,
      amount: Money(amount: 50000, currency: 'TRY'),
      paidOn: '2026-11-08',
      debtor: DebtorRef(
        mode: DebtorRefModeEnum.unitSide,
        unitId: unit12,
        debtorKind: DebtorRefDebtorKindEnum.tenant,
      ),
    );
    expect(json.decode(json.encode(body.toJson())), {
      'site_id': siteId,
      'amount': {'amount': 50000, 'currency': 'TRY'},
      'paid_on': '2026-11-08',
      'debtor': {
        'mode': 'unit_side',
        'unit_id': unit12,
        'debtor_kind': 'tenant',
      },
    });
  });

  test('cached documents survive a JSON round trip', () {
    final dash = MeDashboard.fromJson(dashboardJson());
    final back = MeDashboard.fromJson(
      json.decode(json.encode(dash.toJson())) as Map<String, dynamic>,
    );
    expect(back.sides.single.nextDueDate, dash.sides.single.nextDueDate);
    final st = Statement.fromJson(statementJson());
    final back2 = Statement.fromJson(
      json.decode(json.encode(st.toJson())) as Map<String, dynamic>,
    );
    expect(back2.totalDue.amount, st.totalDue.amount);
  });
}
