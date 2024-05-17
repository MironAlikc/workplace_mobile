import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(41.0),
        child: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const SizedBox(
                width: 20,
                height: 20,
                child: Icon(Icons.abc),
              ),
            ),
            title: const Row(
              children: [Text('Задачи где я ответственый')],
            )),
      ),
    );
  }
}
