import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyStatefulWidget()
    )
  );
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List list = List();
  
  void initState(){
    super.initState();
    list.add("nr.1");
    list.add("nr.2");
    list.add("nr.3");
    list.add("nr.4");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDos",textDirection: TextDirection.ltr,),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){

          },
      ),
      body:ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index){
            return Dismissible(
                key: Key(index.toString()),
                child: ListTile(
                  title: Text(list[index])
                ));
          }
      )
    );
  }
  
}

