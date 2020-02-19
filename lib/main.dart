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

  String input="";
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
            showDialog(
                context: context,
              builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Add ToDo"),
                    content: TextField(
                      onChanged: (String value){
                          input = value;
                      },
                    ),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: (){
                            setState(() {
                              list.add(input);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text("Add")
                      )
                    ],
                  );
              }
            );
          },
      ),
      body:ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index){
            return Dismissible(
                //key: Key(index.toString()),
                key: UniqueKey(),
                child: ListTile(
                  title: Text(list[index])
                ));
          }
      )
    );
  }
  
}

