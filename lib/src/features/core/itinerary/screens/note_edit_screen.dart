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

class NoteEditScreen extends StatefulWidget {
  static const route = '/note-edit';
  @override
  _NoteEditScreenState createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  File? _image;
  final picker = ImagePicker();

  bool firstTime = true;
  late Note selectedNote;
  late dynamic id;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (firstTime) {
      id = Get.arguments['id'] as int;

      if (id == null) {
        print("Hey");
      } else {
        selectedNote = Get.find<NoteController>().getNote(id);

        titleController.text = selectedNote.title;
        contentController.text = selectedNote.content;

        if (selectedNote.imagePath != null) {
          _image = File(selectedNote.imagePath);
        }
      }

      firstTime = false;
    }
  }

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
          IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {
              if (id != null) {
                _showDialog();
              } else {
                Get.back();
              }
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
                  decoration: const InputDecoration(
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
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(
                                () {
                                  _image = null;
                                },
                              );
                            },
                            child: const Icon(
                              Icons.delete,
                              size: 16.0,
                            ),
                          ),
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
                          color: isDark ? Colors.white : Colors.black87)),
                ),
                child: TextField(
                  controller: contentController,
                  maxLines: null,
                  style: createContent,
                  decoration: const InputDecoration(
                    hintText: 'Enter Something...',
                    border: InputBorder.none,
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

    if (id != null) {
      Get.find<NoteController>().addOrUpdateNote(
        id,
        title,
        content,
        imagePath,
        EditMode.UPDATE,
      );
      Get.back();
    } else {
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

  _showDialog() {
    showDialog(
      context: this.context,
      builder: (context) {
        return DeletePopUp(selectedNote: selectedNote);
      },
    );
  }
}
