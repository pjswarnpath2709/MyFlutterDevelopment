import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EffectsOnScreen {
  //shoeing a snakbar on the screen
  static void showSnackBar(
    String message1,
    String message2,
    BuildContext ctx,
    VoidCallback func,
  ) {
    var snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            message1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
            child: VerticalDivider(
              color: Colors.red,
              thickness: 2,
              indent: null,
              endIndent: null,
              width: 20,
            ),
          ),
          ElevatedButton(
            onPressed: func,
            child: Text(
              message2,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(ctx).showSnackBar(
      snackBar,
    );
  }

//showing a custom Toast on the screen , Always use this , this is the only way
  static void showToast(String message, BuildContext ctx) {
    FToast ftoast = FToast();
    ftoast.init(ctx);
    Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Color.fromARGB(255, 106, 103, 103),
        ),
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ));
    ftoast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 1),
    );
  }
}
