import 'dart:io';

import '../lib/todo.dart';
import '../lib/todo_repository.dart';

void main(){
  // print("Hello world!");
//   String name = "Nikita";
//   String? name2 = null;
//   var count = 0;
//   var title = "Учить Rust";
//   var x = 5;
//   // x = "Hello";
//   final id;
//   id = 5;
//   const appName = "TodoApp";
//   print("$name, $name2, $count,${count + 5}, $title, $x, $id, $appName");
//   List<String> tags = ['Иститут', 'Дом'];
//   Map<String,dynamic> data = {'Key': 'value', 'num': 10};
//   Set<int> numbers = {1,2,3,4,1};
//   String greet(String name) => 'Hello $name';
//   printTodo(title: "Купить поесть");
//   printTodo(title: "Сделать ДЗ", done:true);
// }

// void printTodo({required String title, bool done = false}){
//   print('${done ? '+' : '-'} $title');
// }

// class Todo {
//   final int id;
//   String title;
//   bool isDone;
//   Todo({required this.id, required this.title, this.isDone = false});

  TodoRepository repo = TodoRepository();
  printMenu();
  while(true){
    stdout.write('> ');
    String? input = stdin.readLineSync();
    if(input == null){
      continue;
    }
    input = input.trim();
    if(input.isEmpty){
      continue;
    }
    bool shouldExit = heandleCommand(repo,input);
    if (shouldExit){
      break;
    }
  }
}

bool heandleCommand(repo, String input) {
  List<String> parts = input.split(" ");
  String command = parts [0].toLowerCase();
  try{
    switch(command){
      case "add":
      addCommand(repo, input);
      break;
    case "list":
      listCommand(repo);
      break;
    case "done":
      doneCommand(repo, parts);
      break;
    case "delete":
      deleteCommand(repo, parts);
      break;
    case "exit":
      print("Выход из программы");
      return true;
      default:
        print("Неизвестно");
    }
  } catch (e){
    print("Ошибка: $e");
  }
  return false;
}

void printMenu() {
  print("Приложение Todo");
  print("Команды");
  print("add <текст>    - добавить задачу");
  print("list           - показать список");
  print("done<id>       - отметить выполненной");
  print("delete<id>     - удалить задачу");
  print("exit           - выход");
  print("");
  }

  void addCommand (TodoRepository repo, String input) {
    if(input.length <= 4){
      print("Ошибка: мало текста");
      return;
    }
    String title = input.substring(4).trim();
    repo.add(title);
    print("Задача добавлена.");
  }

  void listCommand (TodoRepository repo){
    List<Todo> todos = repo.getAll();
    if(todos.isEmpty){
      print("Список задач пуст");
      return;
    }
    for(var todo in todos){
      print(todo);
    }
  }

  void doneCommand(TodoRepository repo, List<String> parts){
    if (parts.length < 2) {
      print("Ошибка: укажите id");
      return;
    }
    int id = int.parse(parts[1]);
    repo.complete(id);
    print("Задача выполнена");
  }

  
  void deleteCommand(TodoRepository repo, List<String> parts){
    if (parts.length < 2) {
      print("Ошибка: укажите id");
      return;
    }
    int id = int.parse(parts[1]);
    repo.delete(id);
    print("Задача удалена");
  }