
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Portafolio de Marco'),
      actions: [
        IconButton(
          icon: Icon(Icons.contact_page),
          onPressed: () => Navigator.pushNamed(context, '/contact'),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
