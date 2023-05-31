import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/utils/themes/app_theme_controller.dart';

import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../../../authentication/controllers/image_picker_controller.dart';
import '../../../authentication/controllers/profile_controller.dart';
import '../../../authentication/screens/profile/Image_picker.dart';

class Comments extends StatefulWidget {
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  // Initalization for the text Theme
  final ThemeController themeController = Get.find();
  List filedata = [
    // {
    //   'name': 'Chuks Okwuenu',
    //   'pic': 'https://picsum.photos/300/30',
    //   'message': 'I love to code',
    //   'date': '2021-01-01 12:00:00'
    // },
    // {
    //   'name': 'Biggi Man',
    //   'pic': 'https://www.adeleyeayodeji.com/img/IMG_20200522_121756_834_2.jpg',
    //   'message': 'Very cool',
    //   'date': '2021-01-01 12:00:00'
    // },
    // {
    //   'name': 'Tunde Martins',
    //   'pic': 'assets/img/userpic.jpg',
    //   'message': 'Very cool',
    //   'date': '2021-01-01 12:00:00'
    // },
    // {
    //   'name': 'Biggi Man',
    //   'pic': 'https://picsum.photos/300/30',
    //   'message': 'Very cool',
    //   'date': '2021-01-01 12:00:00'
    // },
  ];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: CommentBox.commentImageParser(
                          imageURLorPath: data[i]['pic'])),
                ),
              ),
              title: DefaultTextStyle(
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: themeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black),
                child: Text(
                  data[i]['name'],
                  style: TextStyle(
                      color: themeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,
                      fontSize: 18),
                ),
              ),
              subtitle: Text(
                data[i]['message'],
                style: TextStyle(
                    fontSize: 16,
                    color: themeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black),
              ),
              trailing: DefaultTextStyle(
                style: TextStyle(
                    fontSize: 10,
                    color: themeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black),
                child: Text(data[i]['date']),
              ),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Initalizations for the username data
    final profileController = Get.put(ProfileController());
    final _authRepo = Get.put(AuthenticationRepository());
    final userEmail = _authRepo.firebaseUser.value!.email as String;
    String userName = '';
    profileController.getUserNameData(userEmail);
    userName = profileController.userName.value;

    // Initalizations for the user image
    final _imagePickerController = Get.put(ImagePickerController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Comment Page"),
      ),
      body: Container(
        child: CommentBox(
          userImage: CommentBox.commentImageParser(
              imageURLorPath: _imagePickerController.imageFile.value),
          child: commentChild(filedata),
          labelText: 'Write a comment...',
          errorText: 'Comment cannot be blank',
          withBorder: false,
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': userName,
                  'pic': _imagePickerController.imageFile.value,
                  'message': commentController.text,
                  'date': DateTime.now().toString(),
                };
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          textColor:
              themeController.isDarkMode.value ? Colors.white : VABlackColor,
          sendWidget: Icon(Icons.send_sharp,
              size: 30,
              color: themeController.isDarkMode.value
                  ? Colors.white
                  : VABlackColor),
        ),
      ),
    );
  }
}
