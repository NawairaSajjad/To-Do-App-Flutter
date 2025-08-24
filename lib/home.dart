import 'package:do_to_app/refactor/constants.dart';
import 'package:do_to_app/refactor/refactor.dart';
import 'package:do_to_app/refactor/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Home extends StatefulWidget {
   Home({super.key});
 
   
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _loadTasks();  // Load tasks when app starts
  }
 // ✅ Load tasks from SharedPreferences
  void _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _task = prefs.getStringList('tasks') ?? [];
    });
  }

  // ✅ Save tasks to SharedPreferences
  void _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('tasks', _task);
  }

  // ✅ Delete task
  void deleteFromList(int index) {
    setState(() {
      _task.removeAt(index);
      _saveTasks(); // save updated list
    });
  }

  // ✅ Add task
  void addToList() {
    if (taskController.text.isNotEmpty) {
      setState(() {
        _task.add(taskController.text);
        taskController.clear();
        _saveTasks(); // save updated list
      });
    }
  }
  @override
    List<String> _task = [];
  TextEditingController taskController = TextEditingController();

//  deleteFromList(int index){
// setState(() {
//     _task.removeAt(index);
// });
// }
//   void addToList(){
//     if(taskController.text.isNotEmpty){
//     setState(() {
//       if(taskController.text.isNotEmpty)
//       _task.add(taskController.text);
//       taskController.clear();
//     });
//     }
//   }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('lib/assets/bubble.png',
             height: 150.h,
              width: 180.h,
            ),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: buildBoldText('Make your list of task'),
            ),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
           TextField(
            minLines: 5, // minimum height (10 lines)
            maxLines: 10, // 
            controller: taskController,
            decoration: InputDecoration(
        hintText: 'At 5pm ill learn bloc..',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.black),
        ),
            ),  
        ),
        20.verticalSpace,
        Center(child: Button(actionOfButton: addToList, buttonTitle: 'Add')),
        15.verticalSpace,
        buildBoldText('Tasks:'),
        5.verticalSpace,
        ListView.builder(
           shrinkWrap: true, 
           physics: NeverScrollableScrollPhysics(),
          itemCount: _task.length,
          itemBuilder: (context,index)=>Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: ListTile(
              //  selected: true ,
              selectedTileColor: Colors.green,
                trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
            deleteFromList(index); // safe: runs after build
                    },
                  ),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10),
                   ),
                 
                   tileColor: lightCyan,
                   textColor: whiteColor,
                  //  onLongPress:deleteFromList(index),
              title: Text(_task[index]),
            ),
          ))
        
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
}