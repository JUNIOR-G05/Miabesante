import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:miabesante/models/rdv_model.dart';
import 'package:miabesante/services/rdv_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Rdv extends StatefulWidget {
  const Rdv({super.key});

  @override
  State<Rdv> createState() => _RdvState();
}

class _RdvState extends State<Rdv> {
  final RdvService _rdvService = RdvService();
  late Future<String> _docteurIdFuture;

  @override
  void initState() {
    super.initState();
    _docteurIdFuture = _getDocteurId();
  }

  Future<String> _getDocteurId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RDV"),
      ),
      body: FutureBuilder<String>(
        future: _docteurIdFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || !snapshot.hasData) {
            return Center(
                child: Text("Erreur de chargement de l'ID du docteur"));
          }
          String docteurId = snapshot.data!;
          return StreamBuilder<List<RdvModel>>(
            stream: _rdvService.getRdvsByDocteurId(docteurId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("Erreur de chargement des RDV"));
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text("Aucun RDV trouvé"));
              }
              List<RdvModel> rdvs = snapshot.data!;
              return ListView.builder(
                itemCount: rdvs.length,
                itemBuilder: (context, index) {
                  RdvModel rdv = rdvs[index];
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text("${rdv.nomPatient} - ${rdv.cause}"),
                      subtitle:
                          Text("${rdv.date} à ${rdv.heure} - ${rdv.lieu}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              // _showEditRdvDialog(context, rdv);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              bool? confirm = await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Confirmer la suppression"),
                                    content: Text(
                                        "Êtes-vous sûr de vouloir supprimer ce RDV ?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, false),
                                        child: Text("Annuler"),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, true),
                                        child: Text("Supprimer"),
                                      ),
                                    ],
                                  );
                                },
                              );
                              if (confirm == true) {
                                try {
                                  await _rdvService.deleteRdv(rdv.id);
                                  _showSnackbar(context,
                                      "RDV supprimé avec succès", Colors.green);
                                } catch (e) {
                                  _showSnackbar(
                                      context,
                                      "Erreur lors de la suppression du RDV",
                                      Colors.red);
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _showCreateRdvDialog(context),
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Future<void> _showCreateRdvDialog(BuildContext context) async {
  //   final _formKey = GlobalKey<FormState>();
  //   final TextEditingController causeController = TextEditingController();
  //   final TextEditingController dateController = TextEditingController();
  //   final TextEditingController heureController = TextEditingController();
  //   final TextEditingController lieuController = TextEditingController();
  //   final TextEditingController nomPatientController = TextEditingController();

  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String docteurId = prefs.getString('userId') ?? '';

  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text("Créer un RDV"),
  //         content: Form(
  //           key: _formKey,
  //           child: SingleChildScrollView(
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 TextFormField(
  //                   controller: causeController,
  //                   decoration: InputDecoration(labelText: "Cause"),
  //                   validator: (value) {
  //                     if (value == null || value.isEmpty) {
  //                       return "Veuillez entrer la cause";
  //                     }
  //                     return null;
  //                   },
  //                 ),
  //                 TextFormField(
  //                   controller: dateController,
  //                   decoration: InputDecoration(labelText: "Date"),
  //                   validator: (value) {
  //                     if (value == null || value.isEmpty) {
  //                       return "Veuillez entrer la date";
  //                     }
  //                     return null;
  //                   },
  //                 ),
  //                 TextFormField(
  //                   controller: heureController,
  //                   decoration: InputDecoration(labelText: "Heure"),
  //                   validator: (value) {
  //                     if (value == null || value.isEmpty) {
  //                       return "Veuillez entrer l'heure";
  //                     }
  //                     return null;
  //                   },
  //                 ),
  //                 TextFormField(
  //                   controller: lieuController,
  //                   decoration: InputDecoration(labelText: "Lieu"),
  //                   validator: (value) {
  //                     if (value == null || value.isEmpty) {
  //                       return "Veuillez entrer le lieu";
  //                     }
  //                     return null;
  //                   },
  //                 ),
  //                 TextFormField(
  //                   controller: nomPatientController,
  //                   decoration: InputDecoration(labelText: "Nom du Patient"),
  //                   validator: (value) {
  //                     if (value == null || value.isEmpty) {
  //                       return "Veuillez entrer le nom du patient";
  //                     }
  //                     return null;
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: Text("Annuler"),
  //           ),
  //           TextButton(
  //             onPressed: () async {
  //               if (_formKey.currentState!.validate()) {
  //                 RdvModel newRdv = RdvModel(
  //                   id: '',
  //                   cause: causeController.text,
  //                   docteurId: docteurId,
  //                   date: dateController.text,
  //                   heure: heureController.text,
  //                   lieu: lieuController.text,
  //                   nomPatient: nomPatientController.text,
  //                 );
  //                 try {
  //                   await _rdvService.createRdv(newRdv);
  //                   Navigator.pop(context);
  //                   _showSnackbar(
  //                       context, "RDV créé avec succès", Colors.green);
  //                 } catch (e) {
  //                   _showSnackbar(context, "Erreur lors de la création du RDV",
  //                       Colors.red);
  //                 }
  //               }
  //             },
  //             child: Text("Créer"),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

//   Future<void> _showEditRdvDialog(BuildContext context, RdvModel rdv) async {
//     final _formKey = GlobalKey<FormState>();
//     final TextEditingController causeController =
//         TextEditingController(text: rdv.cause);
//     final TextEditingController dateController =
//         TextEditingController(text: rdv.date);
//     final TextEditingController heureController =
//         TextEditingController(text: rdv.heure);
//     final TextEditingController lieuController =
//         TextEditingController(text: rdv.lieu);
//     final TextEditingController nomPatientController =
//         TextEditingController(text: rdv.nomPatient);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Modifier le RDV"),
//           content: Form(
//             key: _formKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TextFormField(
//                     controller: causeController,
//                     decoration: InputDecoration(labelText: "Cause"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Veuillez entrer la cause";
//                       }
//                       return null;
//                     },
//                   ),
//                   TextFormField(
//                     controller: dateController,
//                     decoration: InputDecoration(labelText: "Date"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Veuillez entrer la date";
//                       }
//                       return null;
//                     },
//                   ),
//                   TextFormField(
//                     controller: heureController,
//                     decoration: InputDecoration(labelText: "Heure"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Veuillez entrer l'heure";
//                       }
//                       return null;
//                     },
//                   ),
//                   TextFormField(
//                     controller: lieuController,
//                     decoration: InputDecoration(labelText: "Lieu"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Veuillez entrer le lieu";
//                       }
//                       return null;
//                     },
//                   ),
//                   TextFormField(
//                     controller: nomPatientController,
//                     decoration: InputDecoration(labelText: "Nom du Patient"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Veuillez entrer le nom du patient";
//                       }
//                       return null;
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text("Annuler"),
//             ),
//             TextButton(
//               onPressed: () async {
//                 if (_formKey.currentState!.validate()) {
//                   RdvModel updatedRdv = RdvModel(
//                     id: rdv.id,
//                     cause: causeController.text,
//                     docteurId: rdv.docteurId,
//                     date: dateController.text,
//                     heure: heureController.text,
//                     lieu: lieuController.text,
//                     nomPatient: nomPatientController.text,
//                   );
//                   try {
//                     await _rdvService.updateRdv(rdv.id, updatedRdv);
//                     Navigator.pop(context);
//                     _showSnackbar(
//                         context, "RDV modifié avec succès", Colors.green);
//                   } catch (e) {
//                     _showSnackbar(context,
//                         "Erreur lors de la modification du RDV", Colors.red);
//                   }
//                 }
//               },
//               child: Text("Modifier"),
//             ),
//           ],
//         );
//       },
//     );
//   }

  void _showSnackbar(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
