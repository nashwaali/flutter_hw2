import 'package:flutter/material.dart';

import 'info.dart';

class StudentModel {
  String id, name, image;

  StudentModel(
    this.id,
    this.image,
    this.name,
  );
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  static List<String> StudentId = [
    '198788',
    '198767',
    '198776',
    '198798',
    '198708'
  ];

  static List<String> Studenturl = [
    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    'https://engineering.unl.edu/images/staff/Kayla-Person.jpg',
    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://www.edarabia.com/wp-content/uploads/2015/11/7-ways-to-become-the-person-everyone-respects.jpg'
  ];

  static List<String> StudentName = [
    'Nashwa',
    'Batool',
    'Ahmad',
    'Mohammad',
    'Aseel'
  ];

  final List<StudentModel> student = List.generate(
      StudentId.length,
      (index) => StudentModel('${StudentId[index]}', '${Studenturl[index]}',
          '${StudentName[index]}'));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Student List"),
        ),
        body: ListView.builder(
          itemCount: student.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InfoScreen(
                          studentModel: student[index],
                        )));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.only(top: 15),
                  height: 120,
                  color: const Color.fromARGB(255, 147, 181, 198),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          "ID : ${student[index].id}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Name : ${student[index].name}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        leading: SizedBox(
                          width: 150,
                          height: 200,
                          child: Image.network(student[index].image),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
