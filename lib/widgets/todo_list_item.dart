import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/models/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    Key? key,
    required this.todo,
    required this.onDelete,
  }) : super(key: key);

  final Todo todo;
  final Function(Todo) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 4,
              ),
            ],
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat('dd/MM/yyyy - HH:mm').format((todo.dateTime)),
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                todo.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              autoClose: true,
              onPressed: (context) {
                onDelete(todo);
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Deletar',
            )
          ],
        ),
      ),
    );
  }
}
