import 'package:First_app/listFilm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Login createState() => _Login();
}

class FormModel {
  String emailAddress;
  String password;
  FormModel({this.emailAddress, this.password});
}

class _Login extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final model = FormModel();
  final _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      // fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://global-img.gamergen.com/cyberpunk-2077-x-minecraft_0900966297.jpg"),
                  fit: BoxFit.cover
              )
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15),
          // height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("Login",
                 textAlign: TextAlign.left,
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 30,
                   fontStyle: FontStyle.normal,

                 )
             ),
             Center(
               child: Form(
                 key: _formKey,
                 child: Padding(
                   padding:EdgeInsets.all(20.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       TextFormField(
                         decoration: InputDecoration(
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                            contentPadding: const EdgeInsets.all(20.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            disabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: "EmailAddress",
                           hintText: "exemple@expl.com",
                         ),
                         validator: (value) {
                           if (value.isEmpty) {
                             return 'Please enter an email address';
                           } else if (!_emailRegExp.hasMatch(value)) {
                             return 'Invalid email address!';
                           }
                           return null;
                         },
                         onSaved: (value) {
                           model.emailAddress = value;
                         },
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top:20),
                         child: TextFormField(
                           obscureText: true,
                           decoration: InputDecoration(
                               focusColor: Colors.white,
                                hoverColor: Colors.white,
                                contentPadding: const EdgeInsets.all(20.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                disabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                labelText: "Password",
                               hintText: " password"
                           ),
                           validator: (value) {
                             if (value.isEmpty) {
                               return 'Please enter some text';
                             }
                             return null;
                           },
                           onSaved: (value) {
                             model.password = value;
                           },
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(vertical: 16.0),
                         child: Center(
                           child: ElevatedButton(
                              
                             onPressed: () {
                               if (_formKey.currentState.validate()) {
                                 _formKey.currentState.save();
                                 Scaffold.of(_formKey.currentContext).showSnackBar(
                                     SnackBar(content: Text('Processing Data')));
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context) => ListFilm()),
                                 );
                               }
                             },
                             child: Text('Submit'),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
             ),
           ],
          ),
        )
      ],
    ));
  }
}
