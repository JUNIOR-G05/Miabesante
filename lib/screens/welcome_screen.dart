// import 'package:flutter/material.dart';
// import 'package:miabesante/screens/login_screen.dart';
// import 'package:miabesante/screens/signup_screen.dart';
// import 'package:miabesante/widgets/navbar_roots.dart';
//
// class WelcomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         padding: EdgeInsets.all(10),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 15,
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => NavBarRoots(),
//                       ));
//                 },
//                 child: Text(
//                   "", // la touche retour
//                   style: TextStyle(
//                     color: Color(0xFF7165D6),
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             Padding(
//               padding: EdgeInsets.all(20),
//               child: Image.asset("images/doctors.png"),
//             ),
//             SizedBox(height: 50),
//             Text(
//               "Miabé santé ",
//               style: TextStyle(
//                 color: Color(0xFF7165D6),
//                 fontSize: 35,
//                 fontWeight: FontWeight.bold,
//                 letterSpacing: 1,
//                 wordSpacing: 2,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "BIENVENUE",
//               style: TextStyle(
//                 color: Colors.black54,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             SizedBox(height: 60),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Material(
//                   color: Color(0xFF7165D6),
//                   borderRadius: BorderRadius.circular(5),
//                   child: InkWell(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => LoginScreen(),
//                           ));
//                     },
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
//                       child: Text(
//                         "Connexion",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Material(
//                   color: Color(0xFF7165D6),
//                   borderRadius: BorderRadius.circular(5),
//                   child: InkWell(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => SignUpScreen(),
//                           ));
//                     },
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
//                       child: Text(
//                         "S'inscrire",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:miabesante/screens/login_screen.dart';
import 'package:miabesante/screens/signup_screen.dart';
import 'package:miabesante/widgets/navbar_roots.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtenir la taille de l'écran
    final size = MediaQuery.of(context).size;
    final double padding = size.width * 0.05;
    final double imageHeight = size.height * 0.3;
    final double buttonWidth = size.width * 0.4;
    final double buttonHeight = size.height * 0.08;

    return Material(
      child: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.02),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavBarRoots(),
                      ));
                },
                child: Text(
                  "", // la touche retour
                  style: TextStyle(
                    color: Color(0xFF7165D6),
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Image.asset(
                "images/doctors.png",
                height: imageHeight,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Text(
              "Miabé santé",
              style: TextStyle(
                color: Color(0xFF7165D6),
                fontSize: size.height * 0.045,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                wordSpacing: 2,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              "BIENVENUE",
              style: TextStyle(
                color: Colors.black54,
                fontSize: size.height * 0.025,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: size.height * 0.08),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Color(0xFF7165D6),
                  borderRadius: BorderRadius.circular(5),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Container(
                      width: buttonWidth,
                      height: buttonHeight,
                      child: Center(
                        child: Text(
                          "Connexion",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Color(0xFF7165D6),
                  borderRadius: BorderRadius.circular(5),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                    },
                    child: Container(
                      width: buttonWidth,
                      height: buttonHeight,
                      child: Center(
                        child: Text(
                          "S'inscrire",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
