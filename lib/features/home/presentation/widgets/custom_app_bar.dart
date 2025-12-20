import "package:flutter/material.dart";
import "package:fruits/core/helper_function/get_user.dart";

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.all(10.0),
      child: ListTile(
        leading: Image.asset('assets/images/pp.png'),
        title:  Text(
          'Good Morning...${getUser().name}',
          style: const TextStyle(color: Colors.grey),
        ),
        subtitle:  const Text('What are you going to do today?'),
        trailing: IconButton(
          onPressed: () {},
          icon: Image.asset('assets/images/notif.png'),
        ),
      ),
    );
  }
}
