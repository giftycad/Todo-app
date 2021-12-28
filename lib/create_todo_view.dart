import 'package:flutter/material.dart';

class CreateTodoView extends StatelessWidget {
  CreateTodoView({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Create To Do',
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
            controller: _titleController,
            maxLines: 1,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                hintText: 'Please enter your title',
                labelText: 'Title',
                labelStyle: TextStyle(
                    color: Color.fromRGBO(37, 43, 103, 1),
                    fontWeight: FontWeight.w600),
                floatingLabelBehavior: FloatingLabelBehavior.never),
            validator: (value) {},
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: _descriptionController,
            maxLines: 4,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                hintText: 'Please enter your description',
                labelText: 'Description',
                labelStyle: TextStyle(
                    color: Color.fromRGBO(37, 43, 103, 1),
                    fontWeight: FontWeight.w600),
                floatingLabelBehavior: FloatingLabelBehavior.never),
            validator: (value) {},
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _dateController,
                  maxLines: 1,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(37, 43, 103, 1))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(37, 43, 103, 1))),
                      hintText: 'Please enter your date',
                      labelText: 'Date',
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(37, 43, 103, 1),
                          fontWeight: FontWeight.w600),
                      floatingLabelBehavior: FloatingLabelBehavior.never),
                  validator: (value) {},
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: TextFormField(
                  controller: _timeController,
                  maxLines: 1,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(37, 43, 103, 1))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(37, 43, 103, 1))),
                      hintText: 'Please enter your time',
                      labelText: 'Time',
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(37, 43, 103, 1),
                          fontWeight: FontWeight.w600),
                      floatingLabelBehavior: FloatingLabelBehavior.never),
                  validator: (value) {},
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(37, 43, 103, 1),
                  padding: const EdgeInsets.all(15)),
              onPressed: () {},
              child: const Text(
                'Create',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
