import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _email, _password;
  bool _isObscured = true;
  Color _eyeButtonColor = Colors.grey;

  Padding buildTitleLine() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 100,
          height: 1.5,
          color: Colors.black,
        ),
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: 40.0,
        ),
      ),
    );
  }

  TextFormField buildEmail() {
    return TextFormField(
      onSaved: (emailInput) {
        _email = emailInput;
      },
      validator: (emailInput) {
        if (emailInput.isEmpty) {
          return 'Please enter an email';
        }
      },
      decoration: InputDecoration(labelText: 'Email Address'),
    );
  }

  TextFormField buildPassword(BuildContext context) {
    return TextFormField(
      onSaved: (passwordInput) {
        _password = passwordInput;
      },
      validator: (passwordInput) {
        if (passwordInput.isEmpty) {
          return 'Please enter a Password';
        }
      },
      decoration: InputDecoration(
          labelText: 'Password',
          suffixIcon: IconButton(
            onPressed: () {
              if (_isObscured) {
                setState(() {
                  _isObscured = false;
                  _eyeButtonColor = Colors.black;
                });
              } else {
                setState(() {
                  _isObscured = true;
                  _eyeButtonColor = Colors.grey;
                });
              }
            },
            icon: Icon(
              Icons.remove_red_eye,
              color: _eyeButtonColor,
            ),
          )),
      obscureText: _isObscured,
    );
  }

  Padding buildForgotPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Forgot Password?',
          style: TextStyle(fontSize: 12.0, color: Colors.grey),
        ),
      ),
    );
  }

  Align buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 50,
        width: 270,
        child: FlatButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              //TODO  values
            }
          },
          color: Colors.grey[900],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.0,
            ),
          ),
        ),
      ),
    );
  }

  Align buildOrText() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        'or login with',
        style: TextStyle(fontSize: 14.0, color: Colors.grey),
      ),
    );
  }

  Row buildSocialMediaButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(30.0),
            //TODO :Implement circle press and Icons
            child: SignInButton(
              Buttons.GoogleDark,
              onPressed: () {},
            ),
          ),
          height: 55.0,
          width: 170.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 0.5)),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(30.0),
            //TODO :Implement circle press and Icons
            child: SignInButton(
              Buttons.Facebook,
              mini: true,
              onPressed: () {},
            ),
          ),
          height: 55.0,
          width: 50.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 0.5)),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(30.0),
            //TODO :Implement circle press and Icons
            child: SignInButton(
              Buttons.Email,
              mini: true,
              onPressed: () {},
            ),
          ),
          height: 55.0,
          width: 50.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 0.5)),
        ),
      ],
    );
  }

  Align buildSignUpText() {
    return Align(
      child: RichText(
        text: TextSpan(
            text: 'You Don\'t have an account?',
            style: TextStyle(fontSize: 15.0, color: Colors.grey),
            children: <TextSpan>[
              TextSpan(
                  text: 'SIGN UP',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                      color: Colors.grey[900]))
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            SizedBox(
              height: kToolbarHeight,
            ),
            buildTitle(),
            buildTitleLine(),
            SizedBox(
              height: 80,
            ),
            buildEmail(),
            SizedBox(
              height: 30,
            ),
            buildPassword(context),
            buildForgotPassword(),
            SizedBox(
              height: 60.0,
            ),
            buildLoginButton(context),
            SizedBox(
              height: 30.0,
            ),
            buildOrText(),
            SizedBox(
              height: 30,
            ),
            //TODO :Social Media Buttons
            buildSocialMediaButtons(),
            SizedBox(
              height: 45.0,
            ),
            buildSignUpText(),
          ],
        ),
      ),
    );
  }
}
