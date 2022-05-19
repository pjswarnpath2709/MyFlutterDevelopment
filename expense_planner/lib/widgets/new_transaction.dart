import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function btnclick;

  NewTransaction(this.btnclick);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final tittlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();

  void submitData() {
    final String enterTitle = tittlecontroller.text;
    final double enterAmount = double.parse(amountcontroller.text);

    if (enterTitle == null || enterAmount <= 0 || enterAmount == null) {
      return;
    }
    widget.btnclick(
      enterTitle,
      enterAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Tittle'),
                controller: tittlecontroller,
                onSubmitted: (_) => submitData(),
                // onChanged: (text) {
                //   titleInput = text;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountcontroller,
                keyboardType: TextInputType.number,
                onSubmitted: (_) =>
                    submitData(), //i dont want to use that value
                // onChanged: (text) {
                //   amountInput = text;
                // },
              ),
              FlatButton(
                textColor: Colors.purple,
                onPressed: submitData,
                child: const Text(
                  'Add Transaction',
                ),
              )
            ]),
      ),
    );
  }
}
