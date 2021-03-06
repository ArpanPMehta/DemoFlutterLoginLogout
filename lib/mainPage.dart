import 'package:demoflutterloginlogout/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: ThemeData(
        accentColor: Colors.white70,
      ),
    );
  }
 }
class MainPage extends StatefulWidget{
  @override
  _MainPageState createState () =>_MainPageState();
}

class _MainPageState extends State<MainPage>{
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     checkLoginStatus();
  }
  checkLoginStatus() async{
    sharedPreferences=await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token")==null){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder:(BuildContext context)=>LoginPage()), (Route<dynamic> route)=> false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login",style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              sharedPreferences.clear();
              sharedPreferences.commit();
            },
            child: Text("Logout",style: TextStyle(color:Colors.white),),
          )
        ],
      ),
      body: Center(
        child: Text("Home Page"),),
      drawer: Drawer(),
    );
  }
}
