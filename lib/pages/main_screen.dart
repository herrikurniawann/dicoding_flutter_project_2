import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isTaskCompleted = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1e1e20),
        actions: <Widget>[
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.message_outlined,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.person_outline, color: Colors.white, size: 30),
              ),
            ],
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
                    'July 7, 2025',
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
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey),
                            ),
                          ),
                          child: CheckboxListTile(
                            title: Text(
                              'Selesaikan Project Flutter',
                              style: TextStyle(color: Colors.white),
                            ),
                            checkColor: Colors.black,
                            activeColor: Colors.white,
                            value: _isTaskCompleted,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _isTaskCompleted = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
