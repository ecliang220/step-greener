import 'package:flutter/material.dart';
import 'package:step_greener/theme/app_colors.dart';

class AppPopup extends StatefulWidget {
  final String? title;
  final String? okButtonText;
  final String? cancelButtonText;
  final Wrap? message;

  const AppPopup(
      {super.key,
      this.title = 'StepGreener Popup',
      this.okButtonText = '',
      this.cancelButtonText = "Close",
      this.message,
      });

  @override
  State<AppPopup> createState() => _AppPopupState();
}

class _AppPopupState extends State<AppPopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.title!,
        style: TextStyle(
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
        )     
      ),
      content: widget.message,
      actions: <Widget>[
        // Row widget to handle alignment of the buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // OK Button aligned to the left
            (widget.okButtonText!.isEmpty)
                ? SizedBox.shrink()
                : TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the popup
                    },
                    child: Text(
                      widget.okButtonText!,
                      style: TextStyle(
                        color: AppColors.textButtonColor,
                      )
                    ),
                  ),
            // Close Button aligned to the right
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the popup
              },
              child: Text(
                widget.cancelButtonText!,
                style: TextStyle(
                  color: AppColors.textButtonColor
                )
              ),
            ),
          ],
        ),
      ],
    );
  }
}
