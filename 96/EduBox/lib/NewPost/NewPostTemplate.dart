import 'package:EduBox/package/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class SubmitForm with ChangeNotifier {
  int _type;
  int _grade = 1;
  String _subject = 'Toán';
  String _address = '';
  List<bool> _days = List.generate(7, (index) => false);
  int _beginHour = DateTime.now().hour;
  int _beginMinute = DateTime.now().minute;
  int _endHour = DateTime.now().hour;
  int _endMinute = DateTime.now().minute;
  DateTime _beginDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  String _gender = '(Nam/Nữ)';
  String _requirement = '';
  double _salary = 10;
  DateTime _postDate = DateTime.now();
  String _whoPost = FirebaseAuth.instance.currentUser.uid;


  String get whoPost => _whoPost;
  set whoPost(String value) {
    _whoPost = value;
    notifyListeners();
  }

  bool _accepted = false;
  String _whoAccept = '';
  List<bool> _canBeSubmit = List.generate(5, (index) => false);

  var formatDateTime = DateFormat('dd-MM-yyyy');
  var formatNumber = NumberFormat('00');

  Map<String, dynamic> toJson() => {
        'Type': type,
        'Grade': grade,
        'Subject': subject,
        'Address': address,
        'Days': {
          'Mon': days[0],
          'Tue': days[1],
          'Wed': days[2],
          'Thus': days[3],
          'Fri': days[4],
          'Sat': days[5],
          'Sun': days[6],
        },
        'Session':
            '${formatNumber.format(beginHour)}:${formatNumber.format(beginMinute)} - ${formatNumber.format(endHour)}:${formatNumber.format(endMinute)}',
        'Course': formatDateTime.format(beginDate).toString() +
            ' - ' +
            formatDateTime.format(endDate).toString(),
        'Gender': gender,
        'RequiredComment': requirement,
        'Salary': salary,
        'PostDate': Timestamp.fromDate(postDate),
        'AcceptorPhoneNumber': '',
        'Owner': whoPost,
        'Acceptor': whoAccept,
        'Accepted': false,
      };

  DateTime get postDate => _postDate;

  set postDate(DateTime value) {
    _postDate = value;
    notifyListeners();
  }



  void reset() {
    type;
    grade = 1;
    subject = 'Toán';
    address = '';
    days = List.generate(7, (index) => false);
    beginHour = DateTime.now().hour;
    beginMinute = DateTime.now().minute;
    endHour = DateTime.now().hour;
    endMinute = DateTime.now().minute;
    beginDate = DateTime.now();
    endDate = DateTime.now();
    gender = '(Nam/Nữ)';
    requirement = '';
    salary = 10;
    postDate = DateTime.now();
    whoPost = FirebaseAuth.instance.currentUser.uid;
  }

  int get type => _type;

  set type(int value) {
    _type = value;
    notifyListeners();
  }

  List<bool> get canBeSubmit => _canBeSubmit;

  set canBeSubmit(List<bool> value) {
    _canBeSubmit = value;
    notifyListeners();
  }

  int get grade => _grade;

  set grade(int value) {
    _grade = value;
    notifyListeners();
  }

  String get subject => _subject;

  set subject(String value) {
    _subject = value;
    notifyListeners();
  }

  String get address => _address;

  set address(String value) {
    _address = value;
    notifyListeners();
  }

  List<bool> get days => _days;

  set days(List<bool> value) {
    _days = value;
    notifyListeners();
  }

  int get beginHour => _beginHour;

  set beginHour(int value) {
    _beginHour = value;
    if (endHour * 60 + endMinute - beginHour * 60 - beginMinute < 60)
      canBeSubmit[2] = false;
    else
      canBeSubmit[2] = true;
    notifyListeners();
  }

  int get endHour => _endHour;

  set endHour(int value) {
    _endHour = value;
    if (endHour * 60 + endMinute - beginHour * 60 - beginMinute < 60)
      canBeSubmit[2] = false;
    else
      canBeSubmit[2] = true;
    notifyListeners();
  }

  int get beginMinute => _beginMinute;

  set beginMinute(int value) {
    _beginMinute = value;
    if (endHour * 60 + endMinute - beginHour * 60 - beginMinute < 60)
      canBeSubmit[2] = false;
    else
      canBeSubmit[2] = true;
    notifyListeners();
  }

  int get endMinute => _endMinute;

  set endMinute(int value) {
    _endMinute = value;
    if (endHour * 60 + endMinute - beginHour * 60 - beginMinute < 60)
      canBeSubmit[2] = false;
    else
      canBeSubmit[2] = true;
    notifyListeners();
  }

  DateTime get beginDate => _beginDate;

  set beginDate(DateTime value) {
    _beginDate = value;
    if (_beginDate.difference(_endDate).inDays > -30)
      canBeSubmit[3] = false;
    else
      canBeSubmit[3] = true;
    notifyListeners();
  }

  DateTime get endDate => _endDate;

  set endDate(DateTime value) {
    _endDate = value;
    if (_beginDate.difference(_endDate).inDays > -30)
      canBeSubmit[3] = false;
    else
      canBeSubmit[3] = true;
    notifyListeners();
  }

  String get gender => _gender;

  set gender(String value) {
    _gender = value;
    notifyListeners();
  }

  String get requirement => _requirement;

  set requirement(String value) {
    _requirement = value;
    notifyListeners();
  }

  double get salary => _salary;

  set salary(double value) {
    _salary = value;
    notifyListeners();
  }

  String get whoAccept => _whoAccept;

  set whoAccept(String value) {
    _whoAccept = value;
    notifyListeners();
  }

  bool get accepted => _accepted;

  set accepted(bool value) {
    _accepted = value;
    notifyListeners();
  }
}
