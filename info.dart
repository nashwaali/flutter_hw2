import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class InfoScreen extends StatefulWidget {
  StudentModel studentModel;
  InfoScreen({
    Key? key,
    required this.studentModel,
  });

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Information")),
      body: Column(
        children: [
          Container(
            color: Colors.blueGrey,
            child: ListTile(
              title: Text(
                widget.studentModel.id,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                widget.studentModel.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              leading: SizedBox(
                width: 250,
                height: 350,
                child: Image.network(widget.studentModel.image),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _itemCount != 0
                  ? IconButton(
                      icon: const Icon(
                        Icons.remove,
                        size: 50,
                      ),
                      onPressed: () => setState(() => _itemCount--),
                    )
                  : Container(),
              Text(
                _itemCount.toString(),
                style: TextStyle(fontSize: 35),
              ),
              IconButton(
                  icon: const Icon(
                    Icons.add,
                    size: 50,
                  ),
                  onPressed: () => setState(() => _itemCount++))
            ],
          )
        ],
      ),
    );
  }
}
