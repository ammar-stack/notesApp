import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var noteController = TextEditingController();
  String addNote = "";
  var borderRadius = const BorderRadius.only(
      topRight: Radius.circular(32),
      bottomRight: Radius.circular(32),
      topLeft: Radius.circular(32),
      bottomLeft: Radius.circular(32));
  List<String> Notes = ["abc"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                "To Do App",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 71, 57, 4),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: ListView.builder(
                      itemCount: Notes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 20,right:20, top:10),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: borderRadius),
                            tileColor: const Color.fromARGB(255, 71, 57, 4),
                            title: Text(
                              Notes[index],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                Notes.removeAt(index);
                              },
                              icon: const Icon(Icons.delete),
                              color: Colors.red,
                            ),
                          ),
                        );
                      }),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    child: Center(
                      child: Padding(
                        padding:const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          controller:noteController,
                          decoration:const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              hintText: 'Enter a Note'),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 75, right: 75, top: 10, bottom: 10),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          addNote = noteController.text.toString();
                          Notes.add(addNote);
                        });
                      },
                      child: Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              color: const Color.fromARGB(255, 71, 57, 4)),
                          child: const Center(
                            child: Text(
                              "Add Note",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          )),
                    ),
                  ),
                )
              ],
            )));
  }
}
