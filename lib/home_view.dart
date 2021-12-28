import 'package:first_todo/create_todo_view.dart';
import 'package:first_todo/utils.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

//stl = stateless widget
//stf = statful widget

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedItem = 'todo';

  final List<Map<String, dynamic>> _uncompletedData = [];

  final List<Map<String, dynamic>> _completedData = [];

  final List<Map<String, dynamic>> data = [
    {
      'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam diam dolor, mollis sed ipsum eget, pretium tincidunt augue. In euismod dui et risus pretium, at lacinia turpis pharetra. Aliquam ut nulla dapibus, egestas lacus in, ultrices sem. Aenean non bibendum felis. Nulla nisi ex, efficitur at lacus eget, luctus efficitur magna. Nulla nec felis felis. Donec eu dolor at diam feugiat dictum',
      'date_time': 'Yesterday',
      'status': true,
    },
    {
      'title':
          'Sed ut velit ullamcorper, fermentum nisi vitae, efficitur felis',
      'description':
          'Aenean placerat dolor in urna finibus, ultrices tincidunt erat scelerisque. Fusce elementum purus ut ipsum blandit pretium',
      'date_time': 'Today',
      'status': true,
    },
    {
      'title': 'Nunc faucibus pretium orci non varius',
      'description':
          'Nam et dictum quam. In sem lectus, ornare condimentum auctor finibus, scelerisque ut nibh. Fusce viverra ut ante in molestie.',
      'date_time': 'Tomorrow',
      'status': false,
    },
    {
      'title':
          'Curabitur quis felis molestie, malesuada lectus vitae, aliquet lorem',
      'description':
          'Donec tempus consequat lobortis. In molestie ante at erat consectetur tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae',
      'date_time': 'Today',
      'status': false,
    },
    {
      'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam diam dolor, mollis sed ipsum eget, pretium tincidunt augue. In euismod dui et risus pretium, at lacinia turpis pharetra. Aliquam ut nulla dapibus, egestas lacus in, ultrices sem. Aenean non bibendum felis. Nulla nisi ex, efficitur at lacus eget, luctus efficitur magna. Nulla nec felis felis. Donec eu dolor at diam feugiat dictum',
      'date_time': 'Mon. 20 Dec',
      'status': false,
    }
  ];

  @override
  void initState() {
    for (Map<String, dynamic> element in data) {
      if (!element['status']) {
        _uncompletedData.add(element);
      } else {
        _completedData.add(element);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'My Tasks',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
        ),
        leading: const Center(
          child: FlutterLogo(
            size: 40,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
              icon: const Icon(Icons.menu),
              onSelected: (value) {
                setState(() {
                  selectedItem = value;
                });
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    child: Text('Todo'),
                    value: 'todo',
                  ),
                  const PopupMenuItem(
                    child: Text('Completed'),
                    value: 'completed',
                  )
                ];
              }),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CreateTodoView();
          }));
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromRGBO(37, 43, 103, 1),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return TaskCardWidget(
                dateTime: selectedItem == 'todo'
                    ? _uncompletedData[index]['date_time']
                    : _completedData[index]['date_time'],
                title: selectedItem == 'todo'
                    ? _uncompletedData[index]['title']
                    : _completedData[index]['title'],
                description: selectedItem == 'todo'
                    ? _uncompletedData[index]['description']
                    : _completedData[index]['description']);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 5,
            );
          },
          itemCount: selectedItem == 'todo'
              ? _uncompletedData.length
              : _completedData.length),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: InkWell(
            onTap: () {
              showBarModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemBuilder: (context, index) {
                          return TaskCardWidget(
                              dateTime: _completedData[index]['date_time'],
                              description: _completedData[index]['description'],
                              title: _completedData[index]['title']);
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 5,
                          );
                        },
                        itemCount: _completedData.length);
                  });
            },
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(37, 43, 103, 1),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      size: 30,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Completed',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      '${_completedData.length}',
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.dateTime})
      : super(key: key);

  final String title;
  final String description;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(
              Icons.check_circle_outline_outlined,
              size: 30,
              color: customColor(date: dateTime),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromRGBO(37, 43, 103, 1)),
                  ),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.notifications_active_outlined,
                  color: customColor(date: dateTime),
                ),
                Text(
                  dateTime,
                  style: TextStyle(color: customColor(date: dateTime)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
