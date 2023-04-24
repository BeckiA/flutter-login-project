import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/features/controllers/profile_controller.dart';
import 'package:login_app/src/features/model/user_model.dart';
import 'package:login_app/src/features/screens/login/login_screen.dart';
import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {}, icon: const Icon(LineAwesomeIcons.angle_left)),
          title: Text(
            VAEditProfile,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(VADefaultSize),
                child: FutureBuilder(
                  future: controller.getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        print(snapshot.data);
                        UserModel userData = snapshot.data as UserModel;
                        // TextField Controllers to get data from TextFields
                        final email =
                            TextEditingController(text: userData.email);
                        final password =
                            TextEditingController(text: userData.password);
                        final fullName =
                            TextEditingController(text: userData.fullName);
                        final phoneNo =
                            TextEditingController(text: userData.phoneNo);
                        return Column(
                          children: [
                            Stack(children: [
                              SizedBox(
                                width: 120,
                                height: 120,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: const Image(
                                      image: AssetImage(VAProfileImage)),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: VAPrimaryColor),
                                  child: const Icon(
                                    LineAwesomeIcons.camera,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                              )
                            ]),
                            const SizedBox(
                              height: 50,
                            ),
                            Form(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      controller: fullName,
                                      style: TextStyle(fontSize: 16.0),
                                      decoration: const InputDecoration(
                                        label: Text(VAFullName),
                                        prefixIcon: Icon(LineAwesomeIcons.user),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    TextFormField(
                                      controller: email,
                                      style: TextStyle(fontSize: 16.0),
                                      decoration: const InputDecoration(
                                        label: Text(VAEmail),
                                        prefixIcon:
                                            Icon(LineAwesomeIcons.envelope),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),

                                    Theme(
                                      data: Theme.of(context).copyWith(
                                        textTheme: Theme.of(context)
                                            .textTheme
                                            .copyWith(
                                              // ignore: deprecated_member_use
                                              subtitle1: TextStyle(
                                                  fontSize: 16,
                                                  color: VASeconsdaryColor),
                                              // change font size here
                                            ),
                                      ),
                                      child: IntlPhoneField(
                                        style: TextStyle(fontSize: 16.0),
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        decoration: InputDecoration(
                                          label: Text(VAPhoneNo),
                                          counterText: "",
                                        ),
                                        initialCountryCode: 'ET',
                                        onChanged: (phone) {
                                          print(phone.completeNumber);
                                          phoneNo.text = phone.completeNumber;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    TextFormField(
                                      obscureText: _obscureText,
                                      controller: password,
                                      style: TextStyle(fontSize: 16.0),
                                      decoration: InputDecoration(
                                        label: Text(VAPassword),
                                        prefixIcon: Icon(LineAwesomeIcons.key),
                                        suffix: IconButton(
                                          icon: Icon(_obscureText
                                              ? LineAwesomeIcons.eye
                                              : LineAwesomeIcons.eye_slash),
                                          onPressed: () {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    const SizedBox(
                                      height: 30.0,
                                    ),

                                    // Form Submmit button
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                          onPressed: () async {
                                            // Get.to(UpdateProfileScreen());
                                            final userData = UserModel(
                                                email: email.text.trim(),
                                                password: password.text.trim(),
                                                fullName: fullName.text.trim(),
                                                phoneNo: phoneNo.text.trim());
                                            await controller
                                                .updateRecord(userData);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: VAPrimaryColor,
                                              side: BorderSide.none,
                                              shape: const StadiumBorder()),
                                          child: const Text(
                                            VAEditProfile,
                                            style: TextStyle(
                                                color: VASeconsdaryColor),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: VAFormHeight,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text.rich(TextSpan(
                                            text: VAJoined,
                                            style: TextStyle(fontSize: 12),
                                            children: [
                                              TextSpan(
                                                  text: VAJoinedAt,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12))
                                            ])),
                                        ElevatedButton(
                                          onPressed: () {
                                            controller.deleteRecord(userData);
                                            Get.to(LoginScreen());
                                          },
                                          child: const Text(VADelete),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.redAccent
                                                  .withOpacity(0.1),
                                              elevation: 0,
                                              foregroundColor: Colors.red,
                                              shape: StadiumBorder(),
                                              side: BorderSide.none),
                                        )
                                      ],
                                    )
                                  ]),
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else {
                        return Center(
                          child: Text('Something went wrong'),
                        );
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ))));
  }
}
