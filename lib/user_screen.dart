import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled2/user.dart';

class UserScreen extends StatefulWidget {
  final User user;

  const UserScreen({super.key, required this.user});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Page"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Center(
                child: ClipOval(
                  child: Image.network("${widget.user.image}", fit: BoxFit.cover,width: 150,),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text("${widget.user.name}",style: TextStyle(color: Colors.blue,fontSize: 25),),
              ),
            ),
            Container(
              child: Center(
                child: Text("${widget.user.city}",style: TextStyle(color: Colors.black,fontSize: 20),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
