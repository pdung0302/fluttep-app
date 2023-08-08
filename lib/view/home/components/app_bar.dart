import 'package:flutter/material.dart';
import '../../../res/images/image_assets.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Card(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.menu,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Card(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.notifications_none,
              color: Colors.grey,
            ),
          ),
        ),
        const Spacer(),
        Card(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              ImageAssets.nightRain,
              height: 30,
              width: 30,
            ),
          ),
        )
      ],
    );
  }
}
