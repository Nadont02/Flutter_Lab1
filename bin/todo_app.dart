void main(){
  print("Hello world!");
  String name = "Nikita";
  String? name2 = null;
  var count = 0;
  var title = "Учить Rust";
  var x = 5;
  // x = "Hello";
  final id;
  id = 5;
  const appName = "TodoApp";
  print("$name, $name2, $count,${count + 5}, $title, $x, $id, $appName");
  List<String> tags = ['Иститут', 'Дом'];
  Map<String,dynamic> data = {'Key': 'value', 'num': 10};
  Set<int> numbers = {1,2,3,4,1};
  String greet(String name) => 'Hello $name';
  printTodo(title: "Купить поесть");
  printTodo(title: "Сделать ДЗ", done:true);
}

void printTodo({required String title, bool done = false}){
  print('${done ? '+' : '-'} $title');
}

class Todo {
  final int id;
  String title;
  bool isDone;
  Todo({required this.id, required this.title, this.isDone = false});
}