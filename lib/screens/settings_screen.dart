import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Remplacez cette importation par l'import de votre page de connexion
import 'login_screen.dart'; // Assurez-vous que ce chemin est correct.

class SettingScreen extends StatelessWidget {
  Future<String?> _getUserNom() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('nom');
  }

  Future<void> _logout(BuildContext context) async {
    // Efface les données de l'utilisateur (ex: nom)
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Redirige vers la page de connexion
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Paramètres",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 30),

          FutureBuilder<String?>(
            future: _getUserNom(),
            builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erreur: ${snapshot.error}');
              } else {
                String nom = snapshot.data ?? 'Nom inconnu';
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("images/doctor1.jpg"),
                  ),
                  title: Text(
                    nom,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                  subtitle: Text("Profil"),
                );
              }
            },
          ),

          Divider(height: 50),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                CupertinoIcons.person,
                color: Colors.blue,
                size: 35,
              ),
            ),
            title: Text(
              "Profil",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          SizedBox(height: 20),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notifications_none_outlined,
                color: Colors.deepPurple,
                size: 35,
              ),
            ),
            title: Text(
              "Notifications",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          SizedBox(height: 20),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.indigo.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.privacy_tip_outlined,
                color: Colors.indigo,
                size: 35,
              ),
            ),
            title: Text(
              "Confidentialité",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          SizedBox(height: 20),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.settings_suggest_outlined,
                color: Colors.green,
                size: 35,
              ),
            ),
            title: Text(
              "Généralités",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          SizedBox(height: 20),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.info_outline_rounded,
                color: Colors.orange,
                size: 35,
              ),
            ),
            title: Text(
              "A propos de nous",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          Divider(height: 40),
          ListTile(
            onTap: () => _logout(context), // Redirection lors de la déconnexion
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.redAccent.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.info_outline_rounded,
                color: Colors.redAccent,
                size: 35,
              ),
            ),
            title: Text(
              "Déconnexion",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}
