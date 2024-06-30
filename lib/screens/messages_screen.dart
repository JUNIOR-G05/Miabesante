// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class Message {
//   final String text;
//   final bool isUser;
//
//   Message({
//     required this.text,
//     required this.isUser,
//   });
// }
//
// class MessagesScreen extends StatefulWidget {
//   @override
//   State<MessagesScreen> createState() => _MessagesScreenState();
// }
//
// class _MessagesScreenState extends State<MessagesScreen> {
//   TextEditingController messageController = TextEditingController();
//   List<Message> messages = [];
//   final String apiKey = ''; // Replace with your actual API key
//
//   Future<void> sendMessage(String message) async {
//     setState(() {
//       messages.add(Message(text: message, isUser: true));
//     });
//
//     try {
//       final response = await getChatbotResponse(message, apiKey);
//       setState(() {
//         messages.add(Message(text: response, isUser: false));
//       });
//     } catch (e) {
//       print('Error getting chatbot response: $e');
//       String errorMessage = 'Désolé, une erreur s\'est produite. Veuillez réessayer plus tard.{$e}';
//       if (e is Exception && e.toString().contains('401')) {
//         errorMessage = 'Erreur d\'autorisation. Vérifiez votre clé API OpenAI.';
//       }
//       setState(() {
//         messages.add(Message(text: errorMessage, isUser: false));
//       });
//     }
//
//     messageController.clear();
//   }
//
//   Future<String> getChatbotResponse(String prompt, String apiKey) async {
//     final url = Uri.parse('https://api.openai.com/v1/completions');
//     final response = await http.post(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $apiKey',
//       },
//       body: jsonEncode({
//         'model': 'text-davinci-003',
//         'prompt': prompt,
//         'max_tokens': 50,
//       }),
//     );
//
//     if (response.statusCode == 200) {
//       final jsonResponse = jsonDecode(response.body);
//       return jsonResponse['choices'][0]['text'].trim();
//     } else {
//       throw Exception('Failed to get chatbot response: ${response.statusCode}');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Miabe IA"),
//         centerTitle: true,
//         backgroundColor: Colors.deepPurpleAccent,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 final message = messages[index];
//                 return ListTile(
//                   title: Text(
//                     message.text,
//                     style: TextStyle(
//                       color: message.isUser ? Colors.blue : Colors.black,
//                     ),
//                     textAlign: message.isUser ? TextAlign.right : TextAlign.left,
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: messageController,
//                     decoration: InputDecoration(
//                       hintText: 'Tapez votre message...',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     final message = messageController.text;
//                     if (message.isNotEmpty) {
//                       sendMessage(message);
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: MessagesScreen(),
//   ));
// }
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Message {
  final String text;
  final bool isUser;

  Message({
    required this.text,
    required this.isUser,
  });
}

class MessagesScreen extends StatefulWidget {
  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  TextEditingController messageController = TextEditingController();
  List<Message> messages = [];
  final String apiUrl = 'http://192.168.1.75:5000/chat'; // Replace with your actual API URL

  Future<void> sendMessage(String message) async {
    setState(() {
      messages.add(Message(text: message, isUser: true));
    });

    try {
      final response = await getChatbotResponse(message);
      setState(() {
        messages.add(Message(text: response, isUser: false));
      });
    } catch (e) {
      print('Error getting chatbot response: $e');
      String errorMessage = 'Désolé, une erreur s\'est produite. Veuillez réessayer plus tard. {$e}';
      setState(() {
        messages.add(Message(text: errorMessage, isUser: false));
      });
    }

    messageController.clear();
  }

  Future<String> getChatbotResponse(String prompt) async {
    final url = Uri.parse(apiUrl);
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'prompt': prompt,
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse['response'];
    } else {
      throw Exception('Failed to get chatbot response: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Miabe IA"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ListTile(
                  title: Text(
                    message.text,
                    style: TextStyle(
                      color: message.isUser ? Colors.blue : Colors.black,
                    ),
                    textAlign: message.isUser ? TextAlign.right : TextAlign.left,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Tapez votre message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final message = messageController.text;
                    if (message.isNotEmpty) {
                      sendMessage(message);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MessagesScreen(),
  ));
}