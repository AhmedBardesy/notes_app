import 'package:app11_nots/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/notecubit/note_cubit.dart';
import 'add_note_body.dart';
import 'appbar.dart';
import 'custom_note_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<NoteCubit>(context).fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteCubitState>(
      builder: (context, state) {
      var  notes = BlocProvider.of<NoteCubit>(context).notes;
        print('rebuid');
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const CustomAppBar(
                  icon: Icons.search,
                  title: 'Notes',
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: notes!.length,
                  itemBuilder: (context, index) =>  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: CustomNoteItem(note:notes[index] ,),
                  ),
                ))
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                context: context,
                builder: (context) => const add_note_body(),
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
