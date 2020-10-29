// import 'package:EduBox/NewPost/NewPostTemplate.dart';
// import 'package:EduBox/package/widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// Color _color = Color(0xff00854c);
// var border = OutlineInputBorder(
//   borderSide: BorderSide(color: _color, width: 1.5),
//   borderRadius: BorderRadius.circular(15),
// );
//
// class PostPhoneNumber extends StatefulWidget {
//   @override
//   _PostPhoneNumberState createState() => _PostPhoneNumberState();
// }
//
// class _PostPhoneNumberState extends State<PostPhoneNumber> {
//   TextEditingController _text = TextEditingController();
//   bool _validate = false;
//   String _error;
//
//   @override
//   void dispose() {
//     _text.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var submitForm = Provider.of<SubmitForm>(context);
//     return Container(
//       child: TextField(
//         controller: _text,
//         maxLines: 3,
//         textInputAction: TextInputAction.done,
//         keyboardType: TextInputType.phone,
//         decoration: InputDecoration(
//           isDense: true,
//           hintText: 'Số điện thoại của bạn',
//           focusedBorder: border,
//           enabledBorder: border,
//           errorText: _validate ? _error : null,
//         ),
//         onChanged: (val) {
//           var text = val;
//           if (text.isEmpty) {
//             submitForm.canBeSubmit[5] = false;
//             setState(() {
//               _validate = true;
//               _error = 'Không để trống';
//             });
//           } else {
//             if (RegExp('\\D').hasMatch(text)) {
//               submitForm.canBeSubmit[5] = false;
//               setState(() {
//                 _validate = true;
//                 _error = 'Không phải dạng số điện thoại';
//               });
//             } else {
//               if(text.length<10) submitForm.canBeSubmit[5] = false;
//               else {
//                 submitForm.canBeSubmit[5] = true;
//                 submitForm.ownerPhoneNumber = text;
//                 setState(() {
//                   _validate = false;
//                 });
//               }
//             }
//           }
//         },
//       ),
//     );
//   }
// }
