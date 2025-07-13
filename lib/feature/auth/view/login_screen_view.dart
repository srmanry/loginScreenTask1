import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loginscreen/common/widgets/bottom_.dart';
import 'package:loginscreen/feature/auth/controller/login_controller.dart';
import 'package:loginscreen/util/styles.dart';

class LoginScreenView extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(key: _formKey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Text('Login to Your\nAccount',style: textBold.copyWith(fontSize: 24.sp),),
              ),
              SizedBox(height:50.h,),
             TextFormField(
               autovalidateMode: AutovalidateMode.onUserInteraction,
               keyboardType: TextInputType.emailAddress,
                controller: controller.emailController,
                decoration: const InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder(),),
                  validator: (value) => controller.validateEmail(value!),),
               SizedBox(height: 10.h),

              Obx(() =>  TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: controller.passwordController,
                obscureText: controller.obscurePassword.value,
                keyboardType: TextInputType.visiblePassword ,

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(controller.obscurePassword.value  ? Icons.visibility_off : Icons.visibility, ),
                    onPressed: () {controller.obscurePassword.toggle();},
                  ),),
                validator: (value) => controller.validatePassword(value!),
              )),
              SizedBox(height: 20.h),
              Obx(() => CustomBottom(
                name: controller.isLoading.value ? "" : "Login",
                isLoading: controller.isLoading.value,
                onTap: () => controller.login(_formKey),
              )),

            ],
          ),
        ),
      ),
    );
  }
}
