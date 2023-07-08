import 'package:flutter/material.dart';
import '../services.dart/lists.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int counter =0;
  @override
  Widget build(BuildContext context) {
    void addToHabitList(String habitName, String habitDescription){
      habitList.add([false,habitName,habitDescription,Icon(Icons.abc)]);
    }

    void addHabit(BuildContext context){
      showDialog(
          context: context,
          builder: (BuildContext context) {
            TextEditingController habitNameController = TextEditingController(text: "Habit Name");
            TextEditingController habitDescriptionController = TextEditingController(text: "Habit Description");
            return AlertDialog(
              title: Text('Add a habit'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: habitNameController,
                  ),
                  TextFormField(
                    controller: habitDescriptionController,
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                    surfaceTintColor: MaterialStateProperty.all(Colors.purpleAccent),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('cancel'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                    surfaceTintColor: MaterialStateProperty.all(Colors.purpleAccent),
                  ),
                  onPressed: () {
                    setState(() {
                      addToHabitList(habitNameController.text, habitDescriptionController.text);
                    });
                  },
                  child: Text("save"),
                ),
              ]);
          });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        onPressed: () {
          addHabit(context);
        },
      ),
      backgroundColor: Colors.grey[600],
      body:  ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                children: [
                  Image.asset('assets/MainBackground.png'),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 140, 0, 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Text('Hey Mihir!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('You have ${habitList.length - counter} habbits left today',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ]),
                      ),
                  ),
                ]),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 584,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Padding(
                    padding:EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(' Keep going',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                          ),
                        ),
                        Text('${((counter)/(habitList.length)*100).round()}%',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.85,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        minHeight: 12,
                        color: Colors.deepPurpleAccent,
                        backgroundColor: Color.fromARGB(255, 192, 170, 250),
                        value: ((counter)/habitList.length),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Divider(),
                  ),
                  SizedBox(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: habitList.length,
                      itemBuilder: (context,int index){
                        return ListTile(
                          title: Text(
                            habitList[index][1],
                          ),
                          subtitle: Text(
                            habitList[index][2],
                          ),
                          trailing: habitList[index][3],
                          leading: Checkbox(
                            value: habitList[index][0],
                            onChanged: ((value){
                              setState(() {
                                if(value==false){
                                  counter-=1;
                                  print(counter.toString());
                                  habitList[index][0] = value;
                                }
                                else{
                                  counter+=1;
                                  print(counter.toString());
                                  habitList[index][0] = value;
                                }
                              });
                            }),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
