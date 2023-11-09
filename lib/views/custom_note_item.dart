import 'package:app11_nots/models/note_model.dart';
import 'package:flutter/material.dart';

import 'edit_note_page.dart';


class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({
    super.key, required this.note,
  });
//add a comment
    final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EditNoteView(),)),
      child: Container(
        padding: const EdgeInsets.only(top: 14, bottom: 24, left: 16),
        decoration: BoxDecoration(
            color: Color(note.dolor), borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title:  Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  note.title,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              subtitle: Text(note.subtitle,
              maxLines: 3,
                  style: TextStyle(color: Colors.black.withOpacity(.6))),
              trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                  onPressed: () {}),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(note.date,
                  style: TextStyle(color: Colors.black.withOpacity(.4))),
            )
          ],
        ),
      ),
    );
  }
}
