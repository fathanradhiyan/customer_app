part of 'widgets.dart';

class EmptyWidget extends StatelessWidget {
  final Size size;
  const EmptyWidget({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.2,),
          Lottie.asset(SharedImage.lottieConfuse, height: size.height * 0.25),
          Text('NO DATA, ADD SOME!', style: TextStyle(letterSpacing: 4, color: Colors.grey[500]),),
        ],
      ),
    );
  }
}
