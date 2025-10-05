import 'package:classico/components/my_receipt.dart';
import 'package:classico/models/restaurant.dart';

import 'package:classico/services/auth/database/firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();
// if we get to this submit the data to firebase db
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Delivery Progress"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: _buildBottomNavBar(context),
        body: Column(
          children: [MyReceipt()],
        ));
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.surface,
              ),
              child: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Muavia Rehan",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Rider",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              ],
            ),
            Spacer(),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child:
                      IconButton(onPressed: () {}, icon: Icon(Icons.message)),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.call,
                        color: Colors.green,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
