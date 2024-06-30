import 'package:flutter/material.dart';

class CompletedSchedule extends StatefulWidget {
  @override
  _CompletedScheduleState createState() => _CompletedScheduleState();
}

class _CompletedScheduleState extends State<CompletedSchedule> {
  // Exemple de données de formulaire
  String _patientName = '';
  DateTime _appointmentDate = DateTime.now();
  TimeOfDay _appointmentTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Exemple de contenu pour les rendez-vous terminés
        ListTile(
          title: Text("Rendez-vous terminé 1"),
          subtitle: Text("Date: 01/07/2024"),
        ),
        ListTile(
          title: Text("Rendez-vous terminé 2"),
          subtitle: Text("Date: 02/07/2024"),
        ),
        // Formulaire de rendez-vous terminé
        ListTile(
          title: Text("Nouveau rendez-vous terminé"),
          onTap: () {
            _showCompletedAppointmentForm(context);
          },
        ),
      ],
    );
  }

  // Méthode pour afficher le formulaire de rendez-vous terminé
  Future<void> _showCompletedAppointmentForm(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Nouveau rendez-vous terminé'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nom du patient'),
                  onChanged: (value) {
                    setState(() {
                      _patientName = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                ListTile(
                  title: Text('Date du rendez-vous'),
                  subtitle: Text(
                    '${_appointmentDate.day}/${_appointmentDate.month}/${_appointmentDate.year}',
                  ),
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _appointmentDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null && pickedDate != _appointmentDate) {
                      setState(() {
                        _appointmentDate = pickedDate;
                      });
                    }
                  },
                ),
                ListTile(
                  title: Text('Heure du rendez-vous'),
                  subtitle: Text(
                    '${_appointmentTime.hour}:${_appointmentTime.minute}',
                  ),
                  onTap: () async {
                    final pickedTime = await showTimePicker(
                      context: context,
                      initialTime: _appointmentTime,
                    );
                    if (pickedTime != null && pickedTime != _appointmentTime) {
                      setState(() {
                        _appointmentTime = pickedTime;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Enregistrer'),
              onPressed: () {
                // Ici, tu peux gérer la logique d'enregistrement du rendez-vous terminé
                print('Enregistrer rendez-vous terminé pour $_patientName');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
