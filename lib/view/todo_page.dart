import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpods/constant/app_sizes.dart';
import 'package:riverpods/models/todo.dart';
import 'package:riverpods/providers/todo_provider.dart';


class TodoPage extends ConsumerWidget {
  TodoPage({super.key});

  final todoController = TextEditingController();
  @override
  Widget build(BuildContext context, ref) {
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
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  hintText: 'add some todo',
                  border: OutlineInputBorder(),
                ),
                onFieldSubmitted: (val){
                  if(val.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text('please provide todo task'))
                    );
                  }else{
                    ref.read(todoProvider.notifier).addTodo(Todo(
                        created_at: DateTime.now().toString(),
                        todo: val.trim()
                    ));
                    todoController.clear();
                  }

                },
              ),

              AppSizes.gapH16,

              Expanded(
                  child: ListView.separated(
                      separatorBuilder: (c, i){
                        return Divider();
                      },
                      itemCount: state.length,
                      itemBuilder: (context, index){
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
                                      onPressed: (){},
                                      icon: Icon(Icons.edit, color: Colors.green,)
                                  ),
                                  IconButton(
                                      onPressed: (){

                                        showDialog(context: context, builder: (context){
                                          return AlertDialog(
                                            title: Text('Hold On'),
                                            content: Text('Are you sure ?'),
                                            actions: [
                                              TextButton(onPressed: (){
                                                Navigator.of(context).pop();
                                                ref.read(todoProvider.notifier).removeTdo(todo);
                                              }, child: Text('sure')),
                                              TextButton(onPressed: (){
                                                Navigator.of(context).pop();
                                              }, child: Text('not sure')),
                                            ],
                                          );
                                        });

                                      },
                                      icon: Icon(Icons.delete, color: Colors.pink,)
                                  ),
                                ],
                              )
                          ),
                        );
                      }
                  )
              )
            ],
          ),
        )
    );
  }
}
