import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/theme/app_color.dart';
import '../../../../app/util/validator.dart';
import '../../../../controller/signin_controller.dart';
import 'id_text_field.dart';
import 'password_text_field.dart';
import 'rounded_container.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final signinController = Get.find<SigninController>();
    return Column(
      children: [
        Spacer(),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Card(
              elevation: 10,
              color: AppColor.container,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildForm(_formKey, signinController),
              ),
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }

  Form _buildForm(
      GlobalKey<FormState> _formKey, SigninController signinController) {
    return Form(
      key: _formKey,
      child: Column(children: [
        RoundedContainer(
          child: IdTextField(
            controller: signinController.idController,
            icon: Icon(Icons.person, color: Colors.black54),
            hintText: 'ID',
            validator: emailValidator,
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        RoundedContainer(
          child: PasswordTextField(
            controller: signinController.pwController,
            icon: Icon(Icons.lock, color: Colors.black54),
            hintText: 'Password',
            validator: passwordBalidator,
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCheckBox(signinController.rememberMe, 'Remember Me',
                  (bool? newValue) {
                signinController.changeRememberMe();
              }),
              _buildCheckBox(signinController.autoSignin, 'Auto Sign In',
                  (bool? newValue) {
                signinController.changeAutoSignin();
              }),
            ],
          ),
        ),
        _buildSigninButton(_formKey, signinController),
      ]),
    );
  }

  Row _buildCheckBox(bool checked, String title, Function(bool?) onChanged) {
    return Row(
      children: [
        Checkbox(
          value: checked,
          onChanged: onChanged,
          checkColor: Colors.white,
          activeColor: AppColor.primary,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.black87, fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildSigninButton(
      GlobalKey<FormState> _formKey, SigninController signinController) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                primary: AppColor.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () => _onSubmit(_formKey, signinController),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSubmit(
      GlobalKey<FormState> formKey, SigninController signinController) async {
    if (formKey.currentState?.validate() == true) {
      await signinController.signin();
    }
  }
}
