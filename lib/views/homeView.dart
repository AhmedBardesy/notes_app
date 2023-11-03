import 'package:flutter/material.dart';

import 'custom_note_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    'Notes',
                    style: TextStyle(fontSize: 25),
                  ),
                  const Spacer(),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.05),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Icon(Icons.search),
                  )
                ],
              ),
            ),
            const NotesItem()
          ],
        ),
      ),
    );
  }
}

class NotesItem extends StatelessWidget {
  const NotesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomNoteItem();
  }
}
