

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:untitled2/rest_api_service.dart';
import 'package:untitled2/user.dart';
import 'package:untitled2/user_screen.dart';
class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final apiService = RestAPIService();
  List<User> userList = <User>[];
  List<bool> favoriteStatusList = [];
  List<User> favoriteUsersList = <User>[];
  late Icon favoriteIcon;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiService.getUsers().then((value){
      if(value != null){
        for (User user in value){
          favoriteStatusList.add(false);
        }
      }
    });
    favoriteIcon=Icon(Icons.favorite_border,color: Colors.red,);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder(
              future: apiService.getUsers(),
              builder: (context,snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data?.length
                ,itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UserScreen(user: snapshot.data![index])));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(

                              blurRadius: 10,
                              spreadRadius: 1,
                              color: Colors.grey.withOpacity(0.5),
                            )
                          ]
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: Container(

                          child: Column(
                            children: [
                              Container(
                                child: ListTile(
                                  title: Text("${snapshot.data![index]?.name}",style: TextStyle(color: Colors.blue,fontSize: 18),),
                                  subtitle: Text("${snapshot.data![index]?.city}"),
                                  leading: ClipOval(
                                    child: Image.network("${snapshot.data![index]?.image}", fit: BoxFit.cover,width: 60,height: 80,),
                                  ),
                                  trailing: IconButton(onPressed: (){
                                    setState(() {
                                      favoriteStatusList[index] = !favoriteStatusList[index];
                                      if(favoriteStatusList.contains(snapshot.data![index])){
                                        favoriteUsersList.remove(snapshot.data![index]);
                                      }else{
                                        favoriteUsersList.remove(snapshot.data![index]);
                                      }
                                    });
                                    for(var item in favoriteUsersList){
                                      print(item.name);
                                    }
                                  },icon: getFavoriteIcon(index),),
                                ),
                              )
                            ]
                          ),
                        ),

                      ),

                    );
                });
              }else{
                return Container(
                  child: Center(
                    child: SpinKitRotatingCircle(
                      color: Colors.orange,
                      size: 50.0,
                    )
                  ),
                );
              }
            },
  )
    )
          ],
        ),
      ),
    );
  }

  Icon getFavoriteIcon(int index) {
    if (favoriteStatusList[index]) {
      return Icon(Icons.favorite, color: Colors.red,);
    } else {
      return Icon(Icons.favorite_border, color: Colors.red,);
    }
  }
}
