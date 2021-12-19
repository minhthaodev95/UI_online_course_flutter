import 'package:flutter/material.dart';
import 'package:online_learning_huweii/src/configs/theme/app_theme.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool _value = false;
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
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: AppTheme.colors.text1,
                        ),
                      ),
                      Text(
                        'Enter your details below & free sign up',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.colors.text3,
                        ),
                      )
                    ]),
              ),
              Positioned(
                top: 140,
                left: 0,
                right: 0,
                child: FormSignUp(context),
              ),
            ],
          )),
    ));
  }

  // ignore: non_constant_identifier_names
  Widget FormSignUp(BuildContext context) {
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
                hintText: '********',
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
              obscureText: _isObscure),
          SizedBox(height: 30.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              primary: const Color(0xFF3D5CFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Create Account',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          ListTile(
            // dense: false,
            contentPadding: EdgeInsets.only(
              left: 0.0,
              right: 0.0,
            ),
            horizontalTitleGap: 0,
            minVerticalPadding: 0,
            minLeadingWidth: 0,
            leading: SizedBox(
              height: 18.0,
              width: 18.0,
              child: Transform.scale(
                scale: 0.7,
                child: Checkbox(
                  // checkColor: Color(0xFF3D5CFF),
                  activeColor: Color(0xFF3D5CFF),
                  side: BorderSide(color: Color(0xFFB8B8D2)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  value: _value,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _value = newValue!;
                    });
                  },
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Align(
                child: Text(
                  'By creating an account you have to agree \nwith our them & condication.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF858597),
                  ),
                ),
                alignment: Alignment(-0.9, 0),
              ),
            ),
          ),
          Row(
            children: [
              Text(' Already have an account？',
                  style: TextStyle(fontSize: 12, color: Color(0xFF858597))),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/LogIn');
                },
                child: Text(' Sign in',
                    style: TextStyle(fontSize: 12, color: Color(0xFF3D5CFF))),
              ),
            ],
          ),
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
