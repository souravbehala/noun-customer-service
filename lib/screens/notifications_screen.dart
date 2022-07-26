import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  //const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: Text('Notifications'),
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        color: Theme.of(context).colorScheme.tertiary,
        child: ListView.builder(
          itemCount: 5,
          padding: EdgeInsets.all(15.0),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            return ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 5.0,
                ),
              ),
              title: Text('Charging successful'),
            );
          },
        ),
      ),
    );
  }
}
