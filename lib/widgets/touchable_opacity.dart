import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TouchableOpacity extends StatefulWidget {
  final void Function()? onTap;
  final double activeOpacity;
  final Widget child;

  const TouchableOpacity({
    super.key,
    required this.onTap,
    this.activeOpacity = 0.3,
    required this.child,
  });

  @override
  State<TouchableOpacity> createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  final Rx<bool> _isPressed = Rx(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _isPressed.value = true;
      },
      onTapUp: (_) {
        _isPressed.value = false;
      },
      onTapCancel: () {
        _isPressed.value = false;
      },
      onTap: widget.onTap,
      child: Obx(
        () => Opacity(
          opacity: _isPressed.value ? widget.activeOpacity : 1,
          child: widget.child,
        ),
      ),
    );
  }
}
