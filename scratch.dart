import 'dart:io';

void main() async {
  taskOne();
  String taskTwoData = await taskTwo();
  taskThree(taskTwoData);
}


void taskOne(){
  String result = 'Result of taskOne';
  print('Task one completed.');
}

Future<String> taskTwo() async {
  Duration fiveSeconds = Duration(seconds: 5);
  String result;
  Future.delayed(fiveSeconds, (){
    result = 'Result of task two';
    print('task two completed');
    });
    return result;
  }


void taskThree(String data){
  String result = 'Result of task three.';
  print('Task three completed and data is $data');
}