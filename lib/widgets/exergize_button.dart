import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ExergizeButton extends StatefulWidget {
  final void Function()? onTap;
  final double activeOpacity;

  const ExergizeButton({
    super.key,
    required this.onTap,
    this.activeOpacity = 0.3,
  });

  @override
  State<ExergizeButton> createState() => _ExergizeButtonState();
}

class _ExergizeButtonState extends State<ExergizeButton> {
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
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            decoration: BoxDecoration(
              color: Color(0xFF252727),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Text(
              'Get started',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF6F6F6),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
