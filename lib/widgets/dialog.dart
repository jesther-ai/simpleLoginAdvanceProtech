import 'package:flutter/material.dart';

generalDialog({
  required BuildContext context,
  required String message,
  required bool isAutoClose,
  required bool isLoading,
  IconData? icon,
}) {
  if (isAutoClose) {
    Future.delayed(const Duration(milliseconds: 1500), () => Navigator.of(context).pop());
  }
  showGeneralDialog(
    barrierDismissible: false,
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return const SizedBox();
    },
    transitionBuilder: (context, anim1, anim2, child) {
      final curvedValue = Curves.easeInOutBack.transform(anim1.value) - 1.0;

      return Transform(
        transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
        child: Opacity(
          opacity: anim1.value,
          child: AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            contentPadding: const EdgeInsets.all(15),
            actionsPadding: const EdgeInsets.only(bottom: 10),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.9),
            content: AnimatedContainer(
              duration: const Duration(milliseconds: 50),
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  isLoading
                      ? const SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.5,
                          ),
                        )
                      : SizedBox(
                          width: 25,
                          height: 25,
                          child: Icon(
                            icon ?? Icons.close,
                            color: Colors.white,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

calendarDialog(BuildContext context, DateTime? initialDate, Function(DateTime) onValue) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return const SizedBox();
    },
    transitionBuilder: (context, anim1, anim2, child) {
      final curvedValue = Curves.easeInOutBack.transform(anim1.value) - 1.0;
      return Transform(
        transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
        child: Opacity(
          opacity: anim1.value,
          child: AlertDialog(
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
            content: SizedBox(
              height: 380,
              width: 450,
              child: CalendarDatePicker(
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
                initialDate: initialDate ?? DateTime.now(),
                onDateChanged: onValue,
              ),
            ),
          ),
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 200),
    barrierDismissible: true,
    barrierLabel: '',
  );
}
