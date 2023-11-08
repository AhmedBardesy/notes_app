import 'package:app11_nots/cubits/cubit/add_note_cubit_cubit.dart';
import 'package:app11_nots/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class add_note_body extends StatelessWidget {
  const add_note_body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider(
        create: (context) => AddNoteCubitCubit(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: BlocConsumer<AddNoteCubitCubit, AddNoteCubitState>(
            listener: (context, state) {
              if (state is AddNoteCubitFailer) {
                print('Failed ${state.errorMessage}');
              } else if (state is AddNoteCubitSuccess) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return const SingleChildScrollView(child: addnoteForm());
            },
          ),
        ),
      ),
    );
  }
}

class addnoteForm extends StatefulWidget {
  const addnoteForm({
    super.key,
  });

  @override
  State<addnoteForm> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<addnoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          input_tet_field(
            maxlins: 1,
            hint: 'Title',
            onsaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          input_tet_field(
            hint: 'Content',
            maxlins: 8,
            onsaved: (value) {
              subtitle = value;
            },
          ),
          const SizedBox(
            height: 25,
          ),
          BlocBuilder<AddNoteCubitCubit, AddNoteCubitState>(
            builder: (context, state) {
              return custom_button(
              loading: state is AddNoteCubitLoading ?true:false,
              pressed: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
                var note = NoteModel(
                    title: title!,
                    subtitle: subtitle!,
                    date: DateTime.now().toString(),
                    dolor: Colors.blueGrey.value);
          
                BlocProvider.of<AddNoteCubitCubit>(context).addNote(note);
              },
            );
            },
          )
          ,const SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}

class input_tet_field extends StatelessWidget {
  input_tet_field({
    @required this.maxlins,
    @required this.onsaved,
    @required this.hint,
  });
  final int? maxlins;
  final Function(String?)? onsaved;
  final String? hint;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlins,
      onSaved: onsaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.blueAccent),
          border: border(),
          enabledBorder: border(),
          focusedBorder: border(Colors.blueAccent)),
    );
  }
}

OutlineInputBorder border([color]) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white));
}

class custom_button extends StatelessWidget {
  const custom_button({
    super.key,
    this.pressed, required this.loading,
  });
  final void Function()? pressed;
  final bool loading;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: const BoxDecoration(),
      child: ElevatedButton(
        onPressed: pressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: 
        loading==true?SizedBox(height: 24,width: 24, child: const CircularProgressIndicator(color: Colors.black,)) : 
        const Text(
         'add',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
    );
  }
}
