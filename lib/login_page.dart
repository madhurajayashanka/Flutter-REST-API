import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled2/home_page.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: Icon(Icons.login),
        title: Align(
            alignment: Alignment.topLeft,
            child: Text("Login Page")),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20
                ),
                child: Center(
                  child: Text('Login',style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width/3,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(child: Image.network("https://www.iconpacks.net/icons/1/free-user-login-icon-305-thumb.png")),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        style: TextStyle(fontSize: 20),
                        controller: _usernameController,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter Username',
                          hintText: 'Username'
                        ),
                      ),
                    ),
                    Container(
                      child: TextFormField(

                        style: TextStyle(fontSize: 20),
                        controller: _passwordController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter Password',
                            hintText: 'Password',

                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 40),
                width: MediaQuery.of(context).size.width/3,
                child: ElevatedButton(
                  child: Text("Login"),
                  onPressed: loginButtonClick,
                ),
              )
            ],
          ),
        ),
        ),
    );
  }
  void loginButtonClick(){
    if(_usernameController.text=='babiya' && _passwordController.text=='babiya'){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));

    }else{
      showAlertDialog(context);
    }
  }
  showAlertDialog(BuildContext buildContext){
    Widget okButton = ElevatedButton(onPressed: (){
      Navigator.pop(context);
    }, child: Text("Okay"));
    AlertDialog alertDialog = AlertDialog(
      title: Text("error"),
      content: Text("Your credentials are wrong"),
      actions: [

      ],
    );
    showDialog(context: context, builder: (BuildContext context){
      return alertDialog;
    });
  }
}
