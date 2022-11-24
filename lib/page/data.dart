import 'package:flutter/material.dart';
import 'package:counter_7/utility/drawer.dart';
import 'package:counter_7/model/budget.dart';

class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key});

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data Budget'),
        ),
        drawer: const NavigationDrawer(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: Budget.budgets.map((budget) {
                return Card(
                  child: ListTile(
                      title: Text("${budget.name}\n${budget.amount}"),
                      subtitle: Text(budget.date.toString().split(' ')[0]),
                      trailing: Text(budget.type)),
                );
              }).toList(),
            ),
          ),
        ));
  }
}
