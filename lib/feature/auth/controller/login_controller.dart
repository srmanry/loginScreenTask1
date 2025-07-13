import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isLoading = false.obs;
  var obscurePassword = true.obs;

  String? validateEmail(String value) {
    final pattern = r'^[\w\.-]+@[\w\.-]+\.\w+$';
    final regExp = RegExp(pattern);
    if (value.isEmpty) return 'Email is required';
    if (!regExp.hasMatch(value)) return 'Enter a valid email';
    return null;
  }

  String? validatePassword(String value) {
    final pattern = r'^(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{6,}$';
    final regExp = RegExp(pattern);
    if (value.isEmpty) return 'Password is required';
    if (!regExp.hasMatch(value)) {
      return 'Password must be 6+ chars,\n1 number & 1 uppercase';
    }
    return null;
  }


  void login(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 3));
    isLoading.value = false;

    Get.defaultDialog(buttonColor: Colors.blue,
      title: "\u{1F389} Congratulation",
      middleText: "You have logged in successfully!",
      textConfirm: "OK",
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back();
      },
    );
  }


  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

}
