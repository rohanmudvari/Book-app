import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpods/models/todo.dart';
import 'package:riverpods/providers/todo_provider.dart';

class TodoPage extends ConsumerWidget {
  TodoPage({super.key});

  final todoController = TextEditingController();
  final todoController1 = TextEditingController();



  @override
  Widget build(BuildContext context, ref) {
    // List dat = [
    //   {'i': 1, 'title': 'lio'},
    //   {'i': 2, 'title': 'mio'}
    // ];
    //
    // dat = [
    //   for(final l in dat) l['i'] == 1  ?{'l': 'cahnge'}: l
    // ];
    //
    // print(dat);

    final state = ref.watch(todoProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo Notifier'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              TextFormField(
                controller: todoController,
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  hintText: 'add some todo',
                  border: OutlineInputBorder(),
                ),
                onFieldSubmitted: (val) {
                  if (val.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text('please provide todo task')));
                  } else {
                    ref.read(todoProvider.notifier).addTodo(Todo(
                        created_at: DateTime.now().toString(),
                        todo: val.trim()));
                    todoController.clear();
                  }
                },
              ),

              // AppSizes.gapH16,
              // CustomButton(
              //     label: 'Login',
              //     onPressed: () {
              //       print('login');
              //     }),
              // CustomButton(
              //     label: 'SignUp',
              //     onPressed: () {
              //       print('register');
              //     }),
              // _buildRow(label: 'sldkjfslkdfjfsdk', iconData: Icons.accessibility_sharp),
              // _buildRow(label: 'jruuwwoewp', iconData: Icons.ac_unit_sharp),

              Expanded(
                  child: ListView.separated(
                      separatorBuilder: (c, i) {
                        return Divider();
                      },
                      itemCount: state.length,
                      itemBuilder: (context, index) {
                        final todo = state[index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.date_range),
                          title: Text(todo.todo),
                          subtitle: Text(todo.created_at),
                          trailing: Container(
                              width: 97,
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        buildShowDialog(
                                            context: context,
                                            isUpdate: true,
                                            todo: todo,
                                            onPressed: (){
                                              Navigator.of(context).pop();
                                              ref.read(todoProvider.notifier).updateTodo(Todo(
                                                  created_at: todo.created_at, todo: todoController1.text));

                                            }
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.green,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        buildShowDialog(
                                            context: context,
                                            isUpdate: false,
                                            todo: todo,
                                            onPressed: (){
                                              Navigator.of(context).pop();
                                              ref.read(todoProvider.notifier).removeTdo(todo);
                                            }
                                        );
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.pink,
                                      )),
                                ],
                              )),
                        );
                      }))
            ],
          ),
        ));
  }

  Future<dynamic> buildShowDialog({
    required BuildContext context,
    required VoidCallback onPressed,
    required bool isUpdate,
    required Todo todo
  }) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(isUpdate ? 'Update Post': 'Hold On'),
            content: isUpdate ? TextFormField(
              controller: todoController1..text = todo.todo,
            ) :Text('Are you sure ?'),
            actions: [
              TextButton(
                  onPressed: onPressed,
                  child: Text('sure')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('not sure')),
            ],
          );
        });
  }

  Row _buildRow({required String label, required IconData iconData}) {
    return Row(
      children: [
        Text(label),
        IconButton(onPressed: () {}, icon: Icon(iconData)),
      ],
    );
  }
}