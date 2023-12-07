part of 'widgets.dart';

Widget textBox({
  String? title,
  bool? isImportant = false,
  TextStyle? style,
  EdgeInsetsGeometry? padding,
  double? height,
  double? width,
  Color? color,
  Widget? child
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.only(left: 2),
          child: title == null
              ? null
              : isImportant!
              ? RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: title,
              style: style ?? TextStyle(color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 1),
              children: const <TextSpan>[
                TextSpan(
                    text: '*',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red)),
              ],
            ),
          )
              : Text(
            title,
            style: style ?? const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 1),
          )),
      title == null
          ? const SizedBox()
          : const SizedBox(
        height: 8,
      ),
      Container(
          padding: padding ?? const EdgeInsets.all(8),
          width: width,
          height: height,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 4),
                    color: peach.withOpacity(0.5),
                    blurRadius: 10),
              ],
              borderRadius: BorderRadius.circular(5),
              color: color ?? Colors.white,
              border: Border.all(width: 1, color: peach)),
          child: child)
    ],
  );
}