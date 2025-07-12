import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dicoding_project/model/data.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Task> _currentTasks = List.from(dummyTasks);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF1e1e20),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person_outline, color: Colors.white, size: 30),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: screenHeight),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Color(0xFF1e1e20)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getFormattedDate(),
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Hallo, John Doe. berikut merupakan daily list anda',
                    style: GoogleFonts.playfairDisplay(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _currentTasks.length,
                    itemBuilder: (context, index) {
                      final task = _currentTasks[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey.withValues(alpha: 5)),
                          ),
                        ),
                        child: CheckboxListTile(
                          title: Text(
                            task.title,
                            style: TextStyle(
                              color: Colors.white,
                              decoration: task.isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              decorationColor: Colors.white,
                            ),
                          ),
                          subtitle: task.description.isNotEmpty
                              ? Text(
                                  task.description,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                )
                              : null,
                          checkColor: Colors.black,
                          activeColor: Colors.white,
                          value: task.isCompleted,
                          onChanged: (bool? newValue) {
                            setState(() {
                              task.isCompleted = newValue!;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: Colors.white,
        child: Icon(Icons.add_box_sharp, color: Color(0xFF1e1e20)),
      ),
    );
  }

  String _getFormattedDate() {
    final now = DateTime.now();
    final List<String> months = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    return '${months[now.month - 1]} ${now.day}, ${now.year}';
  }
}