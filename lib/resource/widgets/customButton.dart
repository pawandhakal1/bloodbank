import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  customButton({
    Key? key,
    required this.onTap,
    required this.ButtonText,
    this.image,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String? ButtonText;
  final Widget? image;

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(8),
      onTap: _isLoading ? null : onTap,
      child: Ink(
        width: MediaQuery.of(context).size.width,
        height: 48,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ButtonText ?? '',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ],
        )),
      ),
    );
  }
}
