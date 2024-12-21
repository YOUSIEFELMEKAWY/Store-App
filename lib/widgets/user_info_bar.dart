import 'package:flutter/material.dart';

class UserInfoBar extends StatelessWidget {
  const UserInfoBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 4.0),
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/IMG_8707.JPG',
              width: 150.0,
              height: 150.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome' ,style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.w300 ),),
            Text('Yousief!' ,style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: (){},
            icon: const Icon(Icons.notification_important_outlined ,size: 35,color: Colors.black,))
      ],
    );
  }
}
