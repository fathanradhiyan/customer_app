part of 'widgets.dart';

class CustomerCard extends StatelessWidget {
  final String name;
  final String initial;
  final String phone;
  final String email;
  final VoidCallback onClick;
  const CustomerCard({
    super.key, required this.name, required this.phone, required this.email, required this.onClick, required this.initial,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        color: peach,
        borderRadius: BorderRadius.circular(12),
        elevation: 2,
        child: InkWell(
          onTap: onClick,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: borderGrey,
                  radius: 45,
                  child: Text(
                    initial,
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(name, maxLines: 1, overflow: TextOverflow.ellipsis, presetFontSizes: const [18, 16],),
                      Text(phone),
                      AutoSizeText(email, maxLines: 1, overflow: TextOverflow.ellipsis, presetFontSizes: const [14, 12],)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}