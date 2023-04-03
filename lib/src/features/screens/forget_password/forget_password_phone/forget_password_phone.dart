import 'package:flutter/material.dart';
import '../../../../common_widgets/form_header_widget.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class ForgetPasswordPhoneScreen extends StatelessWidget {
  const ForgetPasswordPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(VADefaultSize),
          child: Column(
            children: [
              const SizedBox(
                height: VADefaultSize * 4,
              ),
              FormHeader(
                size: size,
                image: VAForgotPassword,
                subTitle: VAForgetPasswordSubTitle,
                title: VAForgot,
                heightBetween: 30,
                textAlign: TextAlign.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              SizedBox(
                height: VAFormHeight,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text(VAPhoneNo),
                        hintText: VAPhoneNo,
                        prefixIcon: Icon(Icons.phone)),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child:
                          ElevatedButton(onPressed: () {}, child: Text(VANext)))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
