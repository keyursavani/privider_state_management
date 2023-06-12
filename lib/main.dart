import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/todo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(create: (context) => TodoProvider(),
    child:MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: const MyHomePage(),
    ),
    );
  }
}
class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomePageState();
  }
}
class MyHomePageState extends State<MyHomePage>{
  @override
  void initState() {
  super.initState();
  WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    Provider.of<TodoProvider>(context ,listen: false).getAllTodo();
  });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider With Api"),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, value, child) {
          if(value.isLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        final todos = value.todos;
        return ListView.builder(
          itemCount: todos.length,
            itemBuilder: (context , index){
            final todo = todos[index];
          return ListTile(
                title: Text(todo.title),
            leading: CircleAvatar(child: Text(todo.id.toString())),
          );
        });
      } ,
      ),
    );
  }
}