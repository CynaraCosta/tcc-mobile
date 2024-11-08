import 'package:flutter/material.dart';
import 'package:tcc_mobile/commons/debugging/debugging.dart';


abstract interface class DebugFloating {
  Widget createBuilderFloating(context, child);
}

class DebugFloatingCaller implements DebugFloating {
  DebugFloatingCaller(
    this.onTap,
  );

  VoidCallback? onTap;

  @override
  Widget createBuilderFloating(context, child) {
    final resultWidget = child ?? const Scaffold();
    if (DebuggingSettings.enabled) {
      ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
        return ErrorWidget(errorDetails.exception);
      };

      return Stack(
        children: [
          resultWidget,
          DraggableFloatingActionButton(
            initialOffset: const Offset(100, 100),
            onPressed: () {
              onTap?.call();
            },
            child: Container(
              width: DebuggingConstants.widthFloatingButton,
              height: DebuggingConstants.heightFloatingButton,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red.withAlpha(200),
              ),
              child: const Center(
                child: Icon(
                  Icons.fire_extinguisher,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    }
    return resultWidget;
  }
}

class DraggableFloatingActionButton extends StatefulWidget {
  const DraggableFloatingActionButton({
    required this.child,
    required this.initialOffset,
    required this.onPressed,
    super.key,
  });

  final Widget child;
  final Offset initialOffset;
  final VoidCallback onPressed;

  @override
  State<StatefulWidget> createState() => _DraggableFloatingActionButtonState();
}

class _DraggableFloatingActionButtonState
    extends State<DraggableFloatingActionButton> {
  late Offset _offset;

  @override
  void initState() {
    super.initState();
    _offset = widget.initialOffset;
  }

  void _updatePosition(DragUpdateDetails position) {
    final mediaQuery = MediaQuery.of(context).size;
    final double newOffsetX = (_offset.dx + position.delta.dx)
        .clamp(0, mediaQuery.width - DebuggingConstants.widthFloatingButton);
    final double newOffsetY = (_offset.dy + position.delta.dy)
        .clamp(0, mediaQuery.height - DebuggingConstants.widthFloatingButton);

    setState(() {
      _offset = Offset(newOffsetX, newOffsetY);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _offset.dx,
      top: _offset.dy,
      child: GestureDetector(
        onPanUpdate: (newPosition) {
          _updatePosition(newPosition);
        },
        onTap: () {
          widget.onPressed();
        },
        child: widget.child,
      ),
    );
  }
}
