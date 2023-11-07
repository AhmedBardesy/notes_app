import 'package:app11_nots/cubits/cubit/add_note_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

Container add_note_body() {
  return Container(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: BlocConsumer<AddNoteCubitCubit, AddNoteCubitState>(
          listener: (context, state) {
            if (state is AddNoteCubitFailer) {
              print('Failed ${state.errorMessage}');
            } else if (state is AddNoteCubitSuccess) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is AddNoteCubitLoading ? true : false,
                child: addnoteForm());
          },
        ),
      ),
    ),
  );
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
          custom_button(
            pressed: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            },
          ),
          const SizedBox(
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
    this.pressed,
  });
  final void Function()? pressed;
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
        child: const Text(
          'add',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
    );
  }
}
