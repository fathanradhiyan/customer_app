part of 'shared.dart';


const Color cream = Color(0xFFFFF2D7);
const Color peach = Color(0xFFFFE8C4);
const Color borderColor = Color(0xFFEBEBEB);
const Color darcula = Color(0xFF2B2727);
const Color lightDarcula = Color(0xFF474444);
const Color successColor = Color(0xFF00CA71);
const Color errorColor = Color(0xFFD9435E);
const Color borderGrey = Color(0xFFEFEFEF);

const Widget signInLoading = SpinKitFadingCircle(
  size: 45,
  color: Colors.white,
);

Map<int, Color> color = {
  50: const Color.fromRGBO(136, 14, 79, .1),
  100: const Color.fromRGBO(136, 14, 79, .2),
  200: const Color.fromRGBO(136, 14, 79, .3),
  300: const Color.fromRGBO(136, 14, 79, .4),
  400: const Color.fromRGBO(136, 14, 79, .5),
  500: const Color.fromRGBO(136, 14, 79, .6),
  600: const Color.fromRGBO(136, 14, 79, .7),
  700: const Color.fromRGBO(136, 14, 79, .8),
  800: const Color.fromRGBO(136, 14, 79, .9),
  900: const Color.fromRGBO(136, 14, 79, 1),
};
