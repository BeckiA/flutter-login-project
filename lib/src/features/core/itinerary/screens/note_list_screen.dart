import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../constants/image_strings.dart';
import '../helper/note_provider.dart';
import '../models/note.dart';
import '../utils/constants.dart';
import '../widgets/note_list_item.dart';
import '../screens/note_edit_screen.dart';
import 'note_add_screen.dart';

class NoteListScreen extends StatelessWidget {
  const NoteListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    Get.put(NoteController());
    final noteController = Get.find<NoteController>();
    return FutureBuilder(
        future: noteController.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            if (snapshot.connectionState == ConnectionState.done) {
              return Scaffold(
                body: Obx(
                  () {
                    if (noteController.items.isEmpty) {
                      return noNotesUI(context);
                    } else {
                      return ListView.builder(
                        itemCount: noteController.items.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return header();
                          } else {
                            final i = index - 1;
                            final item = noteController.items[i];
                            return ListItem(
                              id: item.id,
                              title: item.title,
                              content: item.content,
                              imagePath: item.imagePath,
                              date: item.date,
                            );
                          }
                        },
                      );
                    }
                  },
                ),
                floatingActionButton: Theme(
                  data: ThemeData(
                    // ignore: deprecated_member_use
                    accentColor: isDark ? VAPrimaryColor : VAAccentColor,
                    backgroundColor: Theme.of(context).accentColor,
                    floatingActionButtonTheme: FloatingActionButtonThemeData(),
                  ),
                  child: FloatingActionButton(
                    onPressed: () {
                      goToNoteAddScreen();
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
              );
            }
          }
          return Container();
        });
  }

  Widget header() {
    return Builder(
      builder: (BuildContext context) {
        final isDark =
            MediaQuery.of(context).platformBrightness == Brightness.dark;
        return GestureDetector(
          onTap: _launchUrl,
          child: Container(
            decoration: BoxDecoration(
              color: isDark ? VADTextColor : VALTextColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(75.0),
              ),
            ),
            height: 150,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ITINERARY',
                  style: headerItrenaryStyle,
                ),
                Text(
                  'NOTES',
                  style: headerNotesStyle,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _launchUrl() async {
    const url = 'https://visitamhara.travel/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget noNotesUI(BuildContext context) {
    return ListView(
      children: [
        header(),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Image.asset(
                VAItrenaryImage,
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              ),
            ),
            RichText(
              text: TextSpan(
                style: noNotesStyle,
                children: [
                  const TextSpan(text: ' There is no note available\nTap on "'),
                  TextSpan(
                    text: '+',
                    style: boldPlus,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        goToNoteAddScreen();
                      },
                  ),
                  const TextSpan(text: '" to add new note'),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  void goToNoteAddScreen() {
    Get.to(NoteAddScreen());
  }
}
