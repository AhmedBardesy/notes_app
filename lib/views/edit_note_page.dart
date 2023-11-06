import 'package:app11_nots/views/add_note_body.dart';
import 'package:app11_nots/views/appbar.dart';
import 'package:flutter/material.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomAppBar(title: 'Edit Note', icon: Icons.check),
            SizedBox(height: 16),
            input_tet_field(hint: 'Title' ),
            SizedBox(height: 8,),
            input_tet_field(hint: 'Content',maxlins: 5)
          ],
        ),
      ),
    );
  }
}
