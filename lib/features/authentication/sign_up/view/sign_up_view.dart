import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/colors/app_colors.dart';
import '../../../../shared/widgets/button.dart';
import '../../../../shared/widgets/text_field_widget.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static const routePath = '/signUp';
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _fullNameController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  @override
void initState() {
  super.initState();
  _fullNameController = TextEditingController();
  _phoneController = TextEditingController();
  _passwordController = TextEditingController();
  _formKey = GlobalKey<FormState>();
}
  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }

  bool isPasswordVisible = true;

  bool get isKeyboardOpen => MediaQuery.of(context).viewInsets.bottom > 0;

  void closeKeyboard() {
    if (isKeyboardOpen) {
      FocusScope.of(context).unfocus();
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: closeKeyboard,
      child: Scaffold(
        backgroundColor: AppColors.kBackgroundColor,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/pattern.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 50,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/logo/logo.png',
                          fit: BoxFit.cover,
                          width: 200,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Login To Your Account',
                  style: TextStyle(
                    color: AppColors.kColorWhite,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                TextFieldForms(
                  prefixIcon: Icon(
                    PhosphorIcons.user,
                    color: AppColors.kColorWhite,
                    size: 20,
                  ),
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  hintText: 'Full Name',
                ),
                const SizedBox(height: 20),
                TextFieldForms(
                  prefixIcon: Icon(
                    PhosphorIcons.phone,
                    color: AppColors.kColorWhite,
                    size: 20,
                  ),
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  hintText: 'Phone number',
                ),
                const SizedBox(height: 20),
                TextFieldForms(
                  prefixIcon: Icon(
                    PhosphorIcons.lock_simple,
                    color: AppColors.kColorWhite,
                    size: 20,
                  ),
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  hintText: 'Password',
                  obscureText: isPasswordVisible,
                  suffixIcon: isPasswordVisible
                      ? PhosphorIcons.eye_slash
                      : PhosphorIcons.eye,
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
                SizedBox(height: 20),
                ButtonAction(
                  text: 'Create Account',
                  onPressed: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "already have an account?",
                      style: TextStyle(
                        color: AppColors.kColorWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: AppColors.kPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

