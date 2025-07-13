import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loginscreen/theme/light_theme.dart';


class CustomBottom extends StatelessWidget {
  final Color? bottomColor;
  final double? radius;
  final Widget? widget;
  final String name;
  final Function()? onTap;
  final bool isLoading;
  const CustomBottom({
    super.key,
    this.bottomColor,
    this.widget,
    this.radius,
    this.onTap,
    required this.name, required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48.h, width: double.infinity,
        decoration: BoxDecoration(
          color: bottomColor ?? lightTheme.primaryColor,
          borderRadius: BorderRadius.circular(radius ?? 10.r),
          border: Border.all(width: 1.5, color: Theme.of(context).hoverColor),
        ),

        child: Center(
          child: isLoading ?  SizedBox(
            height: 24.h, width: 24.h,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2.5,),) :
            Text(name, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Theme.of(context).cardColor,),),

        ),
      ),
    );
  }
}




