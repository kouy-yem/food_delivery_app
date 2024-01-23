
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:food_delivery_app/features/authentication/sign_up/sign_up.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/colors/app_colors.dart';
import '../../../../shared/widgets/button.dart';
import '../../../../shared/widgets/snack_bar_top.dart';
import '../../../../shared/widgets/text_field_widget.dart';
import '../../bloc/validation/validator_form_bloc.dart';
import '../../status_view.dart';
import '../widgets/continue_with.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const routePath = '/login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    BlocProvider.of<ValidatorFormBloc>(context).add(
      ValidatorEventFetch(
        phoneNumber: _phoneController.text,
        password: _passwordController.text,
        otp: '',
        confirmPassword: '',
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
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
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  hintText: 'Phone number',
                ),
                const SizedBox(height: 20),
                TextFieldForms(
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
                // forget password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: AppColors.kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                ButtonAction(
                  width: 310,
                  text: 'Login',
                  onPressed: () {
                    //check if the form is valid
                    if (_formKey.currentState!.validate()) {
                      if (_phoneController.text.trim().isEmpty) {
                        SnackBarTop.topDeleteError(
                            context, 'Phone number is required');
                      } else if (_phoneController.text.trim().length < 9) {
                        SnackBarTop.topDeleteError(context,
                            'Phone number must be at least 9 digits');
                      } else if (_passwordController.text.trim().isEmpty) {
                        SnackBarTop.topDeleteError(
                            context, 'Password is required');
                      } else if (_passwordController.text.trim().length <=
                          5) {
                        SnackBarTop.topDeleteError(context,
                            'Password must be at least 6 characters');
                      } else {
                        context.go(StatusView.routePath);
                      }
                    }
                  },
                ),
                const SizedBox(height: 20),
                ContinueWithWidget(),
                // don't have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: AppColors.kColorWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.go(SignUpView.routePath),
                      child: Text(
                        'Sign Up',
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
