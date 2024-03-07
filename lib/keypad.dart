import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class KeyPad extends StatelessWidget {
  final void Function() startGame;

  const KeyPad({super.key, required this.startGame});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.count(
                childAspectRatio: 1.1,
                crossAxisCount: 3,
                children: [
                  Container(),
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blueGrey),
                    child: const Icon(
                      Icons.keyboard_arrow_up_sharp,
                      color: Colors.white,
                    ),
                  ),
                  Container(),
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blueGrey),
                    child: const Icon(
                      Icons.keyboard_arrow_left_sharp,
                      color: Colors.white,
                    ),
                  ),
                  Container(),
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blueGrey),
                    child: const Icon(
                      Icons.keyboard_arrow_right_sharp,
                      color: Colors.white,
                    ),
                  ),
                  Container(),
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blueGrey),
                    child: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Colors.white,
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 50,
              // color: Colors.blueGrey,
              child: ElevatedButton(
                  style: const ButtonStyle(
                    elevation: MaterialStatePropertyAll(5),
                  ),
                  onPressed: startGame,
                  child: const Text("Start")),
            ),
          )
        ],
      ),
    );
  }
}

// class KeyPad extends StatelessWidget {
//   const KeyPad({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//               color: Colors.redAccent,
//               child: Row(
//                 children: [
//                   Flexible(
//                     child: Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: GridView.count(
//                         childAspectRatio: 1.1,
//                         crossAxisCount: 3,
//                         children: [
//                           Container(),
//                           Container(
//                             decoration: const BoxDecoration(
//                                 shape: BoxShape.circle, color: Colors.blueGrey),
//                             child: const Icon(
//                               Icons.keyboard_arrow_up_sharp,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Container(),
//                           Container(
//                             decoration: const BoxDecoration(
//                                 shape: BoxShape.circle, color: Colors.blueGrey),
//                             child: const Icon(
//                               Icons.keyboard_arrow_left_sharp,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Container(),
//                           Container(
//                             decoration: const BoxDecoration(
//                                 shape: BoxShape.circle, color: Colors.blueGrey),
//                             child: const Icon(
//                               Icons.keyboard_arrow_right_sharp,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Container(),
//                           Container(
//                             decoration: const BoxDecoration(
//                                 shape: BoxShape.circle, color: Colors.blueGrey),
//                             child: const Icon(
//                               Icons.keyboard_arrow_down_sharp,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Container(),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       width: 100,
//                       color: Colors.blueGrey,
//                       child: ElevatedButton(
//                     onPressed: startGame, child: const Text("Start")),
//                     ),
//                   )
//                 ],
//               ),
//             );
//   }
// }