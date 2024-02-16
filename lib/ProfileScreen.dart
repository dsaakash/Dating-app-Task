import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String id = '';
  String age = '';
  String distance = '';

  @override
  void initState() {
    super.initState();
    getDataFromSharedPreferences();
  }

  Future<void> getDataFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getString('user_id') ?? '';
      age = prefs.getString('user_age') ?? '';
      distance = prefs.getString('pref_distance') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.grey[300]), // Change back icon color to light grey
        // title: Text('Compatibility Score'),
      ),
      backgroundColor: Colors.black, // Set background color to black
      body: SingleChildScrollView( // Wrap your column with SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              'ID: $id',
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 248, 247, 247),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '$age years old | $distance kms away',
              style: TextStyle(
                fontSize: 14.0,
                color: Color.fromARGB(255, 194, 190, 190), // Light grey color
              ),
            ),
            SizedBox(height: 42.0),
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: const Color.fromARGB(255, 248, 247, 247),
                    fontSize: 18.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Here\'s how well you '),
                    TextSpan(text: 'vibe', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' together.'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(
                      color: Colors.blueAccent,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  'You',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(width: 20.0),
                Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    border: Border.all(
                      color: Colors.yellowAccent,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  'Match',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.green,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0), // Add padding to give space around the image
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0), // Add border radius
                        child: Image.asset(
                          'assets/imagea.png', // Replace with your image path
                          fit: BoxFit.cover, // Cover the entire area
                          width: MediaQuery.of(context).size.width * 0.99, // Adjust the width as needed
                          height: MediaQuery.of(context).size.height * 0.55, // Adjust the height as needed
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

           SizedBox(height: 5.0),

            SizedBox(
              width: 300.0,
              height: 51.0, // Adjust the width as needed
              child: MaterialButton(
                onPressed: () {
                  // Add navigation or functionality here
                },
                color: const Color.fromARGB(255, 250, 249, 249),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // Adjust padding as needed
                child: Center(
                  child: Text(
                    'Initiate Bonding',
                    style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
