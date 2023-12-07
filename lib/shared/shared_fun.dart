part of 'shared.dart';

Future<void> customPopup(BuildContext context,
    {VoidCallback? onOk,
      VoidCallback? onCancel,
      String? labelCancel,
      Widget? title,
      Color? color,
      String? buttonText,
      Widget? content}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: cream,
        title: title ?? const SizedBox(),
        content: content ?? const SizedBox(),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        buttonPadding: const EdgeInsets.all(24),
        actions: <Widget>[
          onCancel!=null ? ElevatedButton(
            onPressed: onCancel,
            style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: cream,
              side: const BorderSide(width: 1, color: peach),
            ),
            child: Text(
              SharedString.cancel,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  ),
            ),
          ): SizedBox(),
          onOk != null? ElevatedButton(
            onPressed: onOk,
            style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              // minimumSize: Size.zero,
              // fixedSize: const Size(80, 30),
              backgroundColor: color ?? peach,
            ),
            child: Text(
              SharedString.delete,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 2),
            ),
          ) : SizedBox(),
        ],
      );
    },
  );
}