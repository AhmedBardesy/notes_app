import 'package:flutter/material.dart';

Container add_note_body() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            input_tet_field(hint: 'Title', ),
            const SizedBox(
              height: 15,
            ),
            input_tet_field(hint: 'Content', maxlins: 8),
            const SizedBox(
              height: 25,
            ),
            const custom_button(),
             const SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    ),
  );
}

TextField input_tet_field({required String hint,  int maxlins = 1}) {

  OutlineInputBorder border([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? Colors.white));
  }

  return TextField(
    maxLines: maxlins,
    decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.blueAccent),
        border: border(),
        enabledBorder: border(),
        focusedBorder: border(Colors.blueAccent)),
  );
}

class custom_button extends StatelessWidget {
  const custom_button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: const BoxDecoration(
          //  color: Colors.red,
          // borderRadius: BorderRadius.circular(40),
          ),
      child: ElevatedButton(
        onPressed: () {},
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
