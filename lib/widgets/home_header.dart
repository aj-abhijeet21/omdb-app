import 'package:flutter/material.dart';
import 'package:omdb_app/services/constants.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 30,
          foregroundImage: AssetImage('assets/images/user.jpg'),
        ),
        const SizedBox(
          width: 20,
        ),
        const SizedBox(
          height: 60,
          // color: Colors.green,
          child: Center(
            child: Text(
              'Chelsie Brett',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 50,
        ),
        Expanded(
          child: TextField(
            cursorColor: pink,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              prefixIconColor: Colors.grey.shade100,
              focusColor: pink,
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 15,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey.shade900,
            ),
          ),
        ),
      ],
    );
  }
}
