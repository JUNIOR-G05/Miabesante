 import 'package:flutter/material.dart';
import 'package:miabesante/screens/note_screen.dart';
import 'package:miabesante/screens/rdv_screen.dart';
// Assurez-vous de créer et d'importer votre page Note

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCard(
              icon: Icons.calendar_today,
              label: 'RDV',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Rdv()),
                );
              },
            ),
            SizedBox(width: 20),
            _buildCard(
              icon: Icons.note,
              label: 'NOTE',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Note()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      {required IconData icon,
      required String label,
      required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 150,
          height: 150,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 64,
                color: Colors.blue,
              ),
              SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
