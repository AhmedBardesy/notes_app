import 'package:flutter/material.dart';

import 'edit_note_page.dart';


class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({
    super.key,
  });
//add a comment
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EditNoteView(),)),
      child: Container(
        padding: const EdgeInsets.only(top: 14, bottom: 24, left: 16),
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: const Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  'Flutter Tips',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              subtitle: Text('Ahmed khaled is the best software engeiner ',
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
              child: Text('May 21,2022',
                  style: TextStyle(color: Colors.black.withOpacity(.4))),
            )
          ],
        ),
      ),
    );
  }
}
