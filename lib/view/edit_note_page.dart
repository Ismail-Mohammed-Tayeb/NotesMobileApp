import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controller/note_controller.dart';

class EditNotePage extends StatelessWidget {
  final NoteController controller = Get.find();

  EditNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int i =
        int.parse(ModalRoute.of(context)!.settings.arguments.toString());
    controller.titleController.text = controller.notes[i].title;
    controller.contentController.text = controller.notes[i].content;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          "Edit Note",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
          ),
          child: Column(
            children: [
              TextField(
                controller: controller.titleController,
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                    letterSpacing: 1,
                  ),
                  border: InputBorder.none,
                ),
              ),
              TextField(
                style: const TextStyle(
                  fontSize: 22,
                ),
                controller: controller.contentController,
                decoration: const InputDecoration(
                  hintText: "Content",
                  hintStyle: TextStyle(
                    fontSize: 17,
                  ),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.updateNote(
              controller.notes[i].id, controller.notes[i].dateTimeCreated);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
