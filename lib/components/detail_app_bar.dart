// import 'package:flutter/material.dart';
//
// class DetailAppBar extends StatelessWidget {
//   const DetailAppBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: const EdgeInsets.all(25),
//       child: Row(children: [
//         InkWell(
//           onTap: (){
//             Navigator.pop(context);
//           },
//           child: const Icon(Icons.arrow_back,
//           size: 30,
//           color: Colors.black,
//           ),
//         ),
//         const Padding(
//             padding: EdgeInsets.only(left: 20),
//           child: Text(
//             "Product",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 23,
//               color: Colors.black,
//             ),
//           ),
//         ),
//
//         const Spacer(),
//         Icon(
//           Icons.favorite_border_outlined,
//           size: 30,
//           color: Colors.red[900],
//         )
//       ],
//       ),
//     );
//   }
// }
