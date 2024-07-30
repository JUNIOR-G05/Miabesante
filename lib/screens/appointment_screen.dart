import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miabesante/models/rdv_model.dart';
import 'package:miabesante/models/user_model.dart';
import 'package:miabesante/services/rdv_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentScreen extends StatefulWidget {
  final UserModel doctor;

  const AppointmentScreen({Key? key, required this.doctor}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  List imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
  ];
  final RdvService _rdvService = RdvService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7165D6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 28,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage("images/doctor1.jpg"),
                        ),
                        SizedBox(height: 15),
                        Text(
                          widget.doctor.nom,
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Thérapeute",
                          style: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xFF9F97E2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.call,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xFF9F97E2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                CupertinoIcons.chat_bubble_text_fill,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 20,
                left: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "A propos du docteur",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Lorem Ipsum est simplement un texte factice de l'industrie de l'imprimerie et de la composition.",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Commentaires",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.star, color: Colors.amber),
                      Text(
                        "4.9",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "(124)",
                        style: TextStyle(color: Colors.black54),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: TextStyle(
                            color: Color(0xFF7165D6),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 160,
                    // width: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                        AssetImage("images/${imgs[index]}"),
                                  ),
                                  title: Text(
                                    "Dr. Docker",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text("il y a 1 jour"),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Text(
                                        "4.9",
                                        style: TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    "Un grand merci au Dr Dear. C'est un médecin formidable et professionnel.",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Localisation",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFFF0EEFA),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: Color(0xFF7165D6),
                        size: 30,
                      ),
                    ),
                    title: Text(
                      "Baguida, Centre médical",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text("adresse du centre médical"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Prix de la consultation",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
                Text(
                  "\$100",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                _showCreateRdvDialog(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Color(0xFF7165D6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Fixez un Rendez-Vous",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showCreateRdvDialog(BuildContext context) async {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController causeController = TextEditingController();
    final TextEditingController dateController = TextEditingController();
    final TextEditingController heureController = TextEditingController();
    final TextEditingController lieuController = TextEditingController();
    final TextEditingController nomPatientController = TextEditingController();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String patientId = prefs.getString('userId') ?? '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Créer un RDV"),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: causeController,
                    decoration: InputDecoration(labelText: "Cause"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Veuillez entrer la cause";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(labelText: "Date"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Veuillez entrer la date";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: heureController,
                    decoration: InputDecoration(labelText: "Heure"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Veuillez entrer l'heure";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: lieuController,
                    decoration: InputDecoration(labelText: "Lieu"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Veuillez entrer le lieu";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: nomPatientController,
                    decoration: InputDecoration(labelText: "Nom du Patient"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Veuillez entrer le nom du patient";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Annuler"),
            ),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  RdvModel newRdv = RdvModel(
                      id: '',
                      cause: causeController.text,
                      docteurId: widget.doctor.id!,
                      date: dateController.text,
                      heure: heureController.text,
                      lieu: lieuController.text,
                      nomPatient: nomPatientController.text,
                      patientId: patientId);
                  try {
                    await _rdvService.createRdv(newRdv);
                    Navigator.pop(context);
                    _showSnackbar(
                        context, "RDV créé avec succès", Colors.green);
                  } catch (e) {
                    _showSnackbar(context, "Erreur lors de la création du RDV",
                        Colors.red);
                  }
                }
              },
              child: Text("Créer"),
            ),
          ],
        );
      },
    );
  }

  void _showSnackbar(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
