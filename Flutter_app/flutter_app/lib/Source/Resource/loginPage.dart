import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:flutter_app/Source/Blocs/login_bloc.dart';

class MainPageStage extends State<MainPageLogin> {
  var title = '';
  final _tf_email = TextEditingController();
  final _tf_pass = TextEditingController();

  LoginBloc bloc = new LoginBloc();

  Container _doLayoutBody(context) {
    return new Container(
        color: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.only(top: 150.0,bottom: 0.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Image.asset(
                "assets/images/icons_fb.png",
              ),
              new Container(
                padding:
                const EdgeInsets.only(top: 40.0, right: 20.0, left: 20.0),
                child: 
                StreamBuilder(
                  stream: bloc.userStream,
                  builder: (context, snapshot) =>new TextFormField(
                  controller: _tf_email,
                  decoration: new InputDecoration(
                    hintText: 'Input your email',
                    filled: true,
                    fillColor: Colors.white,
                    errorText: snapshot.hasError ? snapshot.error : null,
                    icon: new Icon(
                      Icons.people_outline,
                      color: Colors.white,
                    ),
                  ),
                ),)
              ),
              new Container(
                padding:
                const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
                child:
                StreamBuilder(
                  stream: bloc.passwordStream,
                  builder: (context, snapshot) =>  new TextFormField(
                  obscureText: true,
                  controller: _tf_pass,
                  decoration: new InputDecoration(
                    hintText: 'Input your password',
                    filled: true,
                    fillColor: Colors.white,
                    errorText: snapshot.hasError ? snapshot.error: null,
                    icon: new Icon(
                      Icons.vpn_key,
                      color: Colors.white,
                    ),
                  ),
                ),)
              ),
              new Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
                  child: RaisedButton(onPressed: (){
                    setState(() {
                      if(bloc.isValidInfo(_tf_email.text, _tf_pass.text)) {
                        Navigator.push(context, MaterialPageRoute(builder: (context)  => HomePage()));
                      }
                    });
                  },
                    child: const Text("Sign In",
                      style: TextStyle(fontSize: 18.0,color: Colors.white),),
                    color: Colors.indigo,)
              ),
            ],
          ),
        ));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: _doLayoutBody(context),
    );
  }
}

class MainPageLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MainPageStage();
  }
}
