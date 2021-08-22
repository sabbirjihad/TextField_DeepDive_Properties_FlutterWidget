import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    title: "Text Field",
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Scaffold(
      appBar: AppBar(title: Text("Text Field"),),
      backgroundColor: Colors.white,
      body: MyApp(),
    ),
  )
  );
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text='';
  bool _secure=true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration
              (
              hintText: 'Enter Your Name',
              labelText: 'Name',
              labelStyle: TextStyle(
                color: Colors.purple,
                fontSize: 18
              ),
              hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              prefixIcon: Icon(Icons.account_circle),
              suffixIcon: IconButton(
                icon:Icon(_secure?Icons.remove_red_eye:Icons.security),
                onPressed: () {
                setState(() {
                  _secure=!_secure;
                });
              },
              ),
              errorText: text.isEmpty?'Empty':null,
            ),
            keyboardType: TextInputType.text,
            obscureText: _secure,
            obscuringCharacter: '*',
            maxLength: 10,
           // maxLines: 2,
            onChanged: (value){
              text = value;
            },
            onSubmitted: (value){
              setState(() {
                text = value;
              });
              print(value);
            },
          )
        ],
      ),
    );
  }
}
