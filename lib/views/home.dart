import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/widgets/dates/dates_list.dart';
import 'package:todo_app/widgets/drawer_content.dart';
import 'package:todo_app/widgets/form/task_form.dart';
import 'package:todo_app/widgets/todo/todo_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const Drawer(child: DrawerContent()),
      //App bar ==========================================
      appBar: AppBar(
        title: const Text(
          "To do",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
                Text(DateFormat.MMMMEEEEd().format(date)),
                const SizedBox(
                  width: 5,
                ),
                const Icon(Icons.calendar_month)
              ],
            ),
          ),
        ],
      ),
      //Action button ==========================================
      floatingActionButton: FloatingActionButton(
          elevation: 3,
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              elevation: 0,
              // backgroundColor: Colors.white,
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                        left: 20,
                        right: 20,
                        top: 20),
                    child: const TaskForm());
              },
            );
          }),
      //body ==========================================
      body: const Padding(
        padding: EdgeInsets.all(15),
        child: Column(children: [
          DatesList(),
          SizedBox(
            height: 30,
          ),
          ToDoList(),
        ]),
      ),
    );
  }
}
