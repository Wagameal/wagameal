import 'package:app/theme/theme_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_colours.dart';

class CustomButton extends StatefulWidget {
  final Function? onPressed;
  final String buttonTextValue;
  // bool? loading = false;
  bool isButtonDisable;

  CustomButton(
      {super.key,
        required this.onPressed,
        required this.buttonTextValue,
        // this.loading,
        required this.isButtonDisable});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: InkWell(
        onTap: widget.isButtonDisable
            ? null
            : () => {
          widget.onPressed!(),
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(
                color: !widget.isButtonDisable
                    ?  AppColours.primaryColorWM
                    :  AppColours.disableButtonTextColor,
              ),
              color: !widget.isButtonDisable
                  ?  AppColours.primaryColorWM
                  : AppColours.forwardArrowColor,
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: widget.isButtonDisable == true
              ?  Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: context.circularProgressIndicatorColor,
                strokeWidth: 2,
              ),
            ),
          )
              : Center(
            child : Text(
              widget.buttonTextValue,
              style: TextStyle(
                color: !widget.isButtonDisable
                    ? AppColours.textColor
                    : AppColours.disableButtonTextColor,
                fontFamily: "NunitoSansSemiBold",
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
