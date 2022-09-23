import 'package:flutter/material.dart';

class ResizableWidget extends StatefulWidget {
  const ResizableWidget({
    Key? key,
    required this.child,
    this.isFocused = false,
    this.ballColor,
  }) : super(key: key);

  final Widget child;
  final bool isFocused;
  final Color? ballColor;

  @override
  State<ResizableWidget> createState() => _ResizableWidgetState();
}

class _ResizableWidgetState extends State<ResizableWidget> {

  @override
  void didUpdateWidget(covariant ResizableWidget oldWidget) {
   if(widget.isFocused == false) {
     setState(() {
       isFocused =false;
     });
   }
    super.didUpdateWidget(oldWidget);
  }

  bool isFocused = false;

  double height = 400;

  double width = 200;

  double top = 0;

  double left = 0;

  void onDrag(double dx, double dy) {
    var newHeight = height + dy;
    var newWidth = width + dx;

    setState(() {
      height = newHeight > 0 ? newHeight : 0;
      width = newWidth > 0 ? newWidth : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: top,
          left: left,
          child: InkWell(
            onTap: () {
              setState(() {
                isFocused = !isFocused;
              });
            },
            child: ManipulatingWidget.custom(
              onDrag: (dx, dy) {
                setState(() {
                  isFocused = true;
                  top = top + dy;
                  left = left + dx;
                });
              },
              child: Container(
                height: height,
                width: width,
                color: Colors.transparent,
                child: widget.child,
              ),
            ),
          ),
        ),
        // top left
        if (isFocused)
          Positioned(
            top: top - ballDiameter / 2,
            left: left - ballDiameter / 2,
            child: ManipulatingWidget.ball(
              ballColor: widget.ballColor,
              onDrag: (dx, dy) {
                var mid = (dx + dy) / 2;
                var newHeight = height - 2 * mid;
                var newWidth = width - 2 * mid;

                setState(() {
                  height = newHeight > 0 ? newHeight : 0;
                  width = newWidth > 0 ? newWidth : 0;
                  top = top + mid;
                  left = left + mid;
                });
              },
            ),
          ),
        // top middle
        if (isFocused)
          Positioned(
            top: top - ballDiameter / 2,
            left: left + width / 2 - ballDiameter / 2,
            child: ManipulatingWidget.ball(
              ballColor: widget.ballColor,
              onDrag: (dx, dy) {
                var newHeight = height - dy;

                setState(() {
                  height = newHeight > 0 ? newHeight : 0;
                  top = top + dy;
                });
              },
            ),
          ),
        // top right
        if (isFocused)
          Positioned(
            top: top - ballDiameter / 2,
            left: left + width - ballDiameter / 2,
            child: ManipulatingWidget.ball(
              ballColor: widget.ballColor,
              onDrag: (dx, dy) {
                var mid = (dx + (dy * -1)) / 2;

                var newHeight = height + 2 * mid;
                var newWidth = width + 2 * mid;

                setState(() {
                  height = newHeight > 0 ? newHeight : 0;
                  width = newWidth > 0 ? newWidth : 0;
                  top = top - mid;
                  left = left - mid;
                });
              },
            ),
          ),
        // center right
        if (isFocused)
          Positioned(
            top: top + height / 2 - ballDiameter / 2,
            left: left + width - ballDiameter / 2,
            child: ManipulatingWidget.ball(
              ballColor: widget.ballColor,
              onDrag: (dx, dy) {
                var newWidth = width + dx;

                setState(() {
                  width = newWidth > 0 ? newWidth : 0;
                });
              },
            ),
          ),
        // bottom right
        if (isFocused)
          Positioned(
            top: top + height - ballDiameter / 2,
            left: left + width - ballDiameter / 2,
            child: ManipulatingWidget.ball(
              ballColor: widget.ballColor,
              onDrag: (dx, dy) {
                var mid = (dx + dy) / 2;

                var newHeight = height + 2 * mid;
                var newWidth = width + 2 * mid;

                setState(() {
                  height = newHeight > 0 ? newHeight : 0;
                  width = newWidth > 0 ? newWidth : 0;
                  top = top - mid;
                  left = left - mid;
                });
              },
            ),
          ),
        // bottom center
        if (isFocused)
          Positioned(
            top: top + height - ballDiameter / 2,
            left: left + width / 2 - ballDiameter / 2,
            child: ManipulatingWidget.ball(
              ballColor: widget.ballColor,
              onDrag: (dx, dy) {
                var newHeight = height + dy;

                setState(() {
                  height = newHeight > 0 ? newHeight : 0;
                });
              },
            ),
          ),
        // bottom left
        if (isFocused)
          Positioned(
            top: top + height - ballDiameter / 2,
            left: left - ballDiameter / 2,
            child: ManipulatingWidget.ball(
              ballColor: widget.ballColor,
              onDrag: (dx, dy) {
                var mid = ((dx * -1) + dy) / 2;

                var newHeight = height + 2 * mid;
                var newWidth = width + 2 * mid;

                setState(() {
                  height = newHeight > 0 ? newHeight : 0;
                  width = newWidth > 0 ? newWidth : 0;
                  top = top - mid;
                  left = left - mid;
                });
              },
            ),
          ),
        //left center
        if (isFocused)
          Positioned(
            top: top + height / 2 - ballDiameter / 2,
            left: left - ballDiameter / 2,
            child: ManipulatingWidget.ball(
              ballColor: widget.ballColor,
              onDrag: (dx, dy) {
                var newWidth = width - dx;

                setState(() {
                  width = newWidth > 0 ? newWidth : 0;
                  left = left + dx;
                });
              },
            ),
          ),
        // center center
        // if (isFocused)
        //   Positioned(
        //     top: top + height / 2 - ballDiameter / 2,
        //     left: left + width / 2 - ballDiameter / 2,
        //     child: ManipulatingWidget.ball(
        //       onDrag: (dx, dy) {
        //         setState(() {
        //           top = top + dy;
        //           left = left + dx;
        //         });
        //       },
        //       // child: FittedBox(child: Icon(Icons.arr),),
        //     ),
        //   ),
      ],
    );
  }
}

const ballDiameter = 30.0;

class ManipulatingWidget extends StatefulWidget {
  final Function onDrag;
  final Widget? child;
  final Color? ballColor;

  const ManipulatingWidget.ball({Key? key, required this.onDrag, this.ballColor})
      : child = null,
        super(key: key);

  const ManipulatingWidget.custom({
    Key? key,
    required this.onDrag,
    this.ballColor,
    required this.child,
  }) : super(key: key);

  @override
  State<ManipulatingWidget> createState() => _ManipulatingWidgetState();
}

class _ManipulatingWidgetState extends State<ManipulatingWidget> {
  double? initX;

  double? initY;

  _handleDrag(details) {
    setState(() {
      initX = details.globalPosition.dx;
      initY = details.globalPosition.dy;
    });
  }

  _handleUpdate(details) {
    var dx = details.globalPosition.dx - initX;
    var dy = details.globalPosition.dy - initY;
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    widget.onDrag(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _handleDrag,
      onPanUpdate: _handleUpdate,
      child: widget.child ?? Container(
        width: ballDiameter,
        height: ballDiameter,
        decoration: BoxDecoration(
          color: widget.ballColor ?? Colors.blue.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
