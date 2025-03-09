import '/flutter_flow/flutter_flow_util.dart';
import 'notifications_settings_widget.dart' show NotificationsSettingsWidget;
import 'package:flutter/material.dart';

class NotificationsSettingsModel
    extends FlutterFlowModel<NotificationsSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // Stores action output result for [Custom Action - subscribeToQOTDTopic] action in SwitchListTile widget.
  bool? subSuccess;
  // Stores action output result for [Custom Action - unsubscribeFromQOTDTopic] action in SwitchListTile widget.
  bool? unSubSuccess;
  // State field(s) for likesSwitch widget.
  bool? likesSwitchValue;
  // State field(s) for commentsSwitch widget.
  bool? commentsSwitchValue;
  // State field(s) for followerSwitch widget.
  bool? followerSwitchValue;
  // State field(s) for commentReplySwitch widget.
  bool? commentReplySwitchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
