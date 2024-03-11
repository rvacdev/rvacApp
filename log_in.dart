import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ClassesPage(),
    );
  }
}

class ClassesPage extends StatefulWidget {
  @override
  _ClassesPageState createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  List<Class> classes = [];
  int totalVolunteerHours = 0;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volunteer Classes'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total Volunteer Hours: $totalVolunteerHours'),
                SizedBox(height: 20),
                Text(
                  'Classes:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: classes.length,
              itemBuilder: (context, index) {
  return ListTile(
    title: Text(classes[index].className),
    subtitle: Text('Time: ${classes[index].formattedTime}'),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Attendees: ${classes[index].attendees}'),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                _showAttendClassDialog(index);
              },
              child: Text('Attend Class'),
            ),
          ],
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            _removeClass(index);
          },
          child: Text('Remove Class'),
        ),
      ],
    ),
  );
},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                _showAddClassDialog(context);
              },
              child: Text('Add Class'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showAddClassDialog(BuildContext context) async {
  TextEditingController classNameController = TextEditingController();

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Add Class'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: classNameController,
              decoration: InputDecoration(labelText: 'Class Name'),
            ),
            ElevatedButton(
              onPressed: () async {
                TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (time != null) {
                  setState(() {
                    selectedStartTime = time;
                  });
                }
              },
              child: Text(selectedStartTime == null
                  ? 'Select Start Time'
                  : 'Start Time: ${selectedStartTime!.format(context)}'),
            ),
            ElevatedButton(
              onPressed: () async {
                TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (time != null) {
                  setState(() {
                    selectedEndTime = time;
                  });
                }
              },
              child: Text(selectedEndTime == null
                  ? 'Select End Time'
                  : 'End Time: ${selectedEndTime!.format(context)}'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                String className = classNameController.text;

                if (className.isNotEmpty &&
                    selectedStartTime != null &&
                    selectedEndTime != null) {
                  classes.add(Class(
                    className: className,
                    startTime: selectedStartTime!,
                    endTime: selectedEndTime!,
                    attendees: 0,
                  ));
                }

                // Clear selected times for the next class
                selectedStartTime = null;
                selectedEndTime = null;

                Navigator.of(context).pop();
              });
            },
            child: Text('Add'),
          ),
        ],
      );
    },
  );
}


  Future<void> _showAttendClassDialog(int index) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Attend Class'),
        content: Text('Will you attend the class?'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                classes[index].attendees++;
              });
              _updateTotalVolunteerHours(); // Call to update total hours
              Navigator.of(context).pop();
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No'),
          ),
        ],
      );
    },
  );
}



  void _removeClass(int index) {
  setState(() {
    totalVolunteerHours -= classes[index].endTime.hour - classes[index].startTime.hour;
    classes.removeAt(index);
  });
}


  void _updateTotalVolunteerHours() {
  totalVolunteerHours = 0;
  for (var classItem in classes) {
    totalVolunteerHours += classItem.endTime.hour - classItem.startTime.hour;
  }
}
}

class Class {
  final String className;
  final TimeOfDay startTime;
  TimeOfDay endTime;
  int attendees;

  Class({
    required this.className,
    required this.startTime,
    required this.endTime,
    this.attendees = 0,
  });

  String get formattedTime {
    String startSuffix = startTime.period == DayPeriod.am ? 'AM' : 'PM';
    String endSuffix = endTime.period == DayPeriod.am ? 'AM' : 'PM';

    return '${startTime.hourOfPeriod}:${startTime.minute.toString().padLeft(2, '0')} $startSuffix - ${endTime.hourOfPeriod}:${endTime.minute.toString().padLeft(2, '0')} $endSuffix';
  }
}
