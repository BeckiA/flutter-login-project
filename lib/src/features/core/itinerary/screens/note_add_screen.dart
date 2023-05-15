import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../constants/colors.dart';
import '../helper/note_provider.dart';
import '../models/note.dart';
import '../utils/constants.dart';
import '../widgets/delete_popup.dart';
import 'note_view_screen.dart';

class NoteAddScreen extends StatefulWidget {
  static const route = '/note-add';
  @override
  _NoteAddScreenState createState() => _NoteAddScreenState();
}

class _NoteAddScreenState extends State<NoteAddScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  File? _image;
  final picker = ImagePicker();

  bool firstTime = false;
  late Note selectedNote;
  late dynamic id;

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? Colors.black87 : Colors.white,
      appBar: AppBar(
        elevation: 0.7,
        backgroundColor: isDark ? Colors.black87 : Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
          color: isDark ? Colors.white : Colors.black87,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera),
            color: isDark ? Colors.white : Colors.black87,
            onPressed: () {
              getImage(ImageSource.camera);
            },
          ),
          IconButton(
            icon: const Icon(Icons.image),
            color: isDark ? Colors.white : Colors.black87,
            onPressed: () {
              getImage(ImageSource.gallery);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 5.0, top: 10.0, bottom: 5.0),
              child: Theme(
                data: Theme.of(context).copyWith(
                  inputDecorationTheme: InputDecorationTheme(
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          color: isDark ? Colors.white : Colors.black87)),
                ),
                child: TextField(
                  controller: titleController,
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  style: createTitle,
                  decoration: InputDecoration(
                    hintText: 'Enter Itinerary Title',
                  ),
                ),
              ),
            ),
            if (_image != null)
              Container(
                padding: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width,
                height: 250.0,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: FileImage(_image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 5.0, top: 10.0, bottom: 5.0),
              child: Theme(
                data: Theme.of(context).copyWith(
                    inputDecorationTheme: InputDecorationTheme(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            color: isDark ? Colors.white : Colors.black87))),
                child: TextField(
                  controller: contentController,
                  maxLines: null,
                  style: createContent,
                  decoration: const InputDecoration(
                    hintText: 'Enter Something...',
                  ),
                ),
              ),
            ),
          ],
        ),
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
            if (titleController.text.isEmpty) {
              titleController.text = 'Untitled Itinerary';
            }
            saveNote();
          },
          child: const Icon(Icons.save),
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void getImage(ImageSource imageSource) async {
    final pickedFile = await picker.getImage(source: imageSource);

    if (pickedFile == null) return;

    File tmpFile = File(pickedFile.path);
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = basename(pickedFile.path);

    tmpFile = await tmpFile.copy('${appDir.path}/$fileName');

    setState(() {
      _image = tmpFile;
    });
  }

  void saveNote() {
    String title = titleController.text.trim();
    String content = contentController.text.trim();
    String? imagePath = _image?.path ?? ''; // use null-aware operator

    int id = DateTime.now().millisecondsSinceEpoch;
    Get.find<NoteController>().addOrUpdateNote(
      id,
      title,
      content,
      imagePath,
      EditMode.ADD,
    );
    Get.offNamed(NoteViewScreen.route, arguments: {'id': id});
  }
}
