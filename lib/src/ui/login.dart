import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_learning_huweii/src/configs/theme/app_theme.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(
            top: 20,
          ),
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(color: Color(0xFFF0F0F2)),
                height: MediaQuery.of(context).size.height - 20,
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: 60.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: AppTheme.colors.text1,
                        ),
                      ),
                    ]),
              ),
              Positioned(
                top: 140,
                left: 0,
                right: 0,
                child: FormLogIn(context),
              ),
            ],
          )),
    ));
  }

  // ignore: non_constant_identifier_names
  Widget FormLogIn(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 30.0,
        left: 20.0,
        right: 20.0,
      ),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      height: MediaQuery.of(context).size.height - 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Your Email',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF858597),
            ),
          ),
          TextFormField(
              controller: _emailController,
              decoration: inputDecoration(hintText: 'example@gmail.com')),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            'Password',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF858597),
            ),
          ),
          TextFormField(
            controller: _passController,
            decoration: inputDecoration(
              hintText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
            ),
            obscureText: _isObscure,
          ),
          SizedBox(height: 10.0),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'Forget password?',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF858597),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              primary: const Color(0xFF3D5CFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/MainScreen');
            },
            child: const Text(
              'Log In',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ' Don\'t have an account？',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF858597),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/SignUp');
                },
                child: Text(
                  ' Sign up',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF3D5CFF),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 1,
                width: 103.5,
                color: Color(0xFFB8B8D2),
              ),
              Text(
                'Or login with',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF858597),
                ),
              ),
              Container(
                height: 1,
                width: 103.5,
                color: Color(0xFFB8B8D2),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset('assets/icon_svg/google-min.svg'), //
              ),
              SizedBox(width: 35.0),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset('assets/icon_svg/facebook-min.svg'), //
              ),
            ],
          )
        ],
      ),
    );
  }

  InputDecoration inputDecoration({String? hintText, IconButton? suffixIcon}) {
    return InputDecoration(
      suffixIcon: suffixIcon,
      isDense: true,
      contentPadding: EdgeInsets.all(10.0),
      hintText: hintText,
      hintStyle:
          TextStyle(color: Color(0xFF858597).withOpacity(0.9), fontSize: 12),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        gapPadding: 0.0,
        borderSide: BorderSide(color: Color(0xFFB8B8D2), width: 0.1),
      ),
    );
  }
}
