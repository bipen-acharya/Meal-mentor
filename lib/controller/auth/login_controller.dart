import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class LoginController extends GetxController {
  var registerFormKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

    var passwordObscure = true.obs;
      void onEyeClick() {
    passwordObscure.value = !passwordObscure.value;
  }

}
