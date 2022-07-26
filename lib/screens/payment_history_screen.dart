import 'package:flutter/material.dart';
import '../widgets/payment_list_item.dart';

class PaymentHistoryScreen extends StatelessWidget {
  //const PaymentHistoryScreen({Key? key}) : super(key: key);
  static const routeName = 'payment_history_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: Text('Payment History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return PaymentListItem();
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
