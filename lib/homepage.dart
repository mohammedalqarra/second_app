import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz app"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 14, 198, 161),
      ),
      drawer: Drawer(
        elevation: 25,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            UserAccountsDrawerHeader(
              accountName: Text('Mohammed'),
              accountEmail: Text('moh@gmail.com'),
              decoration: BoxDecoration(color: Colors.teal),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.pink,
                child: Text(
                  "M",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.create),
              title: Text('Create Quiz'),
            ),
            ListTile(
              leading: Icon(Icons.question_mark),
              title: Text('Start  Quiz'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Exit'),
            ),
          ],
        ),
      ),
    );
  }
}
