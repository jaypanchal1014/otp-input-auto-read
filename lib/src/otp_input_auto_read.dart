import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SmartOtpField extends StatefulWidget {
  final int length;
  final bool autoRead;

  final double boxSize;
  final double spacing;

  final Color borderColor;
  final Color focusedBorderColor;
  final Color fillColor;

  final TextStyle? textStyle;
  final Function(String)? onCompleted;

  const SmartOtpField({
    super.key,
    this.length = 6,
    this.autoRead = false,
    this.boxSize = 55,
    this.spacing = 10,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.blue,
    this.fillColor = Colors.transparent,
    this.textStyle,
    this.onCompleted,
  });

  @override
  State<SmartOtpField> createState() => _SmartOtpFieldState();
}

class _SmartOtpFieldState extends State<SmartOtpField>
    with CodeAutoFill {

  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();

    _controllers =
        List.generate(widget.length, (_) => TextEditingController());

    _focusNodes =
        List.generate(widget.length, (_) => FocusNode());

    if (widget.autoRead) {
      listenForCode();
    }
  }

  @override
  void dispose() {
    cancel();
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  void codeUpdated() {
    if (code != null) {
      String cleaned =
          code!.replaceAll(RegExp(r'\D'), '');

      if (cleaned.length >= widget.length) {
        for (int i = 0; i < widget.length; i++) {
          _controllers[i].text = cleaned[i];
        }

        widget.onCompleted?.call(
          cleaned.substring(0, widget.length),
        );

        _focusNodes.last.unfocus();
      }
    }
  }

  void _onChanged(String value, int index) {

    // If user pasted full OTP
    if (value.length > 1) {
      String cleaned =
          value.replaceAll(RegExp(r'\D'), '');

      for (int i = 0;
          i < cleaned.length && i < widget.length;
          i++) {
        _controllers[i].text = cleaned[i];
      }

      widget.onCompleted?.call(
        cleaned.substring(0, widget.length),
      );

      return;
    }

    // Move next
    if (value.isNotEmpty &&
        index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    // Backspace move previous
    if (value.isEmpty &&
        index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    String otp =
        _controllers.map((e) => e.text).join();

    if (otp.length == widget.length &&
        !otp.contains('')) {
      widget.onCompleted?.call(otp);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (index) {

        return Container(
          width: widget.boxSize,
          height: widget.boxSize,
          margin: EdgeInsets.symmetric(
              horizontal: widget.spacing / 2),
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            style: widget.textStyle ??
                const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
              counterText: "",
              filled: true,
              fillColor: widget.fillColor,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: widget.borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color:
                        widget.focusedBorderColor,
                    width: 2),
              ),
            ),
            onChanged: (value) =>
                _onChanged(value, index),
          ),
        );
      }),
    );
  }
}
