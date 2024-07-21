import 'package:flutter/material.dart';
import 'package:test_nav_app/src/widgets/info_popup.dart';

class ClickableMarker extends StatefulWidget {
  final Function markerFunction;
  bool showWidget;

  ClickableMarker({
    super.key,
    required this.markerFunction,
    this.showWidget = false,
  });

  @override
  State<ClickableMarker> createState() => _ClickableMarkerState();
}

class _ClickableMarkerState extends State<ClickableMarker> {
  void showPopup(bool show) {
    widget.showWidget = show;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.markerFunction();
        setState(() {
          showPopup(true);
        });
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            "lib/src/images/ic_tracker_75dp.png",
          ),
          const Padding(
            padding: EdgeInsets.only(top: 7),
            child: CircleAvatar(
              radius: 25,
              backgroundImage:
                  AssetImage("lib/src/images/marker_avatar_placeholder.jpg"),
            ),
          ),
          widget.showWidget ? InfoPopup() : Container(),
        ],
      ),
    );
  }
}
