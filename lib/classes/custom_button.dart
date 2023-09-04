// import 'package:boxing/classes/custom_text.dart';
// import 'package:flutter/material.dart';
//
// class CustomButton extends StatelessWidget {
//   final Function()? onPressed;
//   final String? title;
//
//   const CustomButton({
//     this.onPressed,
//     required this.title,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//         style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
//         onPressed: onPressed ?? () => Navigator.pop(context),
//         child: Text(
//           title ?? "OK",
//           style: const TextStyle(
//             fontSize: 18,
//           ),
//         ));
//   }
// }
//
// Widget customButton({List<Color>? colorList, Color? borderColor, text, textColor, fSize,fontWeight, required Function()? onTap}) {
//   return InkWell(
//     onTap: onTap ?? () {},
//     child: Container(
//       alignment: Alignment.center,
//       height: 55,
//       width: Get.width,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           gradient: LinearGradient(
//               colors: colorList ?? []),
//         //  color: btnColor,
//           border: Border.all(color: borderColor ?? Colors.black)),
//       child: CustomTextWidget(
//         text: text,
//         fontSize: fSize,
//         fontWeight: fontWeight,
//         textColor: textColor
//
//       ),
//     ),
//   );
// }