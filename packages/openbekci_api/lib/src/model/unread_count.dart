//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'unread_count.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UnreadCount {
  /// Returns a new [UnreadCount] instance.
  UnreadCount({

    required  this.unread,

    required  this.visitorApprovalsPending,
  });

  @JsonKey(
    
    name: r'unread',
    required: true,
    includeIfNull: false,
  )


  final int unread;



      /// Pending visitor approval requests (0.3); polled together.
  @JsonKey(
    
    name: r'visitor_approvals_pending',
    required: true,
    includeIfNull: false,
  )


  final int visitorApprovalsPending;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UnreadCount &&
      other.unread == unread &&
      other.visitorApprovalsPending == visitorApprovalsPending;

    @override
    int get hashCode =>
        unread.hashCode +
        visitorApprovalsPending.hashCode;

  factory UnreadCount.fromJson(Map<String, dynamic> json) => _$UnreadCountFromJson(json);

  Map<String, dynamic> toJson() => _$UnreadCountToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

