import 'package:flutter/material.dart';

import 'add_note_body.dart';
import 'appbar.dart';
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
            const CustomAppBar(icon: Icons.search,title: 'Notes',),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: CustomNoteItem(),
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15), topRight: Radius.circular(15))),
            context: context,
            builder: (context) => add_note_body(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
