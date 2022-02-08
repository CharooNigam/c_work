class Task {
  final String name;
  bool isDone;
  final String uid;



  Task({required this.name, this.isDone = false, required this.uid});

  void toggleDone() {
    isDone = !isDone;
  }

  Map<String, dynamic> toDbJson(){
    Map<String, dynamic> json = {};
    json['name'] = name;
    json['isDone'] = isDone;
    json['uid'] = uid;
    return json;
  }
}
