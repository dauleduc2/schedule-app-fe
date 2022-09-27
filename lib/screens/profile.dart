import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_app_fe/core/form/TextField.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: const Center(
            child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    "https://scontent.fsgn13-4.fna.fbcdn.net/v/t1.6435-1/205956104_2751433955079159_2840020984542922686_n.jpg?stp=dst-jpg_p320x320&_nc_cat=107&ccb=1-7&_nc_sid=7206a8&_nc_ohc=hBFCrjSeb58AX_o6vnY&_nc_ht=scontent.fsgn13-4.fna&oh=00_AT-l2kiDBscqzhT_ldEmZqxmy4PxuNA9ZcEdBKKQ-HsZ-A&oe=635A5F58")),
          ),
        ),
        TextFieldC(
          controller: _usernameController,
          label: "Username",
          name: "username",
        )
      ],
    );
  }
}
