part of 'widgets.dart';

class BottomButton extends StatefulWidget {
  final String text;
  final bool? loading;
  final GestureTapCallback? onClick;
  final Color? color;
  const BottomButton({Key? key, required this.text, this.loading = false, this.onClick, this.color}) : super(key: key);

  @override
  _BottomButtonState createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    bool? isLoading = widget.loading;
    return Container(
        color: cream,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: widget.onClick,
              style: ElevatedButton.styleFrom(
                elevation: 2,
                backgroundColor: widget.color
              ),
              child: isLoading! ? signInLoading : Text(
                widget.text,
                style: const TextStyle(letterSpacing: 1, fontSize: 16),
              ),
            ),
          ),
        ),
      );
  }
}
