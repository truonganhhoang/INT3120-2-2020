import 'package:EduBox/package/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
//
// class CanBeSubmit with ChangeNotifier {
//   bool _can = true;
//
//   bool get can => _can;
//
//   set can(bool value) {
//     _can = value;
//     notifyListeners();
//   }
// }
//
// class Grade with ChangeNotifier {
//   int _grade = 0;
//
//   int get stateGrade => _grade;
//
//   set stateGrade(int value) {
//     _grade = value;
//     notifyListeners();
//   }
// }
//
// class Subject with ChangeNotifier {
//   int _subject = 0;
//
//   int get stateSubject => _subject;
//
//   set stateSubject(int value) {
//     _subject = value;
//     notifyListeners();
//   }
// }
//
// class Address with ChangeNotifier {
//   String _address = '';
//
//   String get stateAddress => _address;
//
//   set stateAddress(String value) {
//     _address = value;
//     notifyListeners();
//   }
// }
//
// class LearnDays with ChangeNotifier {
//   List<bool> _learnDays = List.generate(7, (index) => false);
//
//   List get stateLearnDays => _learnDays;
//
//   set stateLearnDays(List value) {
//     _learnDays = value;
//     notifyListeners();
//   }
// }
//
// class BeginTime with ChangeNotifier {
//   int _beginTime = DateTime.now().hour;
//
//   int get stateBeginTime => _beginTime;
//
//   set stateBeginTime(int value) {
//     _beginTime = value;
//     notifyListeners();
//   }
// }
//
// class EndTime with ChangeNotifier {
//   int _endTime = DateTime.now().hour + 2;
//
//   int get stateEndTime => _endTime;
//
//   set stateEndTime(int value) {
//     _endTime = value;
//     notifyListeners();
//   }
// }
//
// class BeginDate with ChangeNotifier {
//   DateTime _pickedDate = DateTime.now();
//
//   DateTime get statePickedDate => _pickedDate;
//
//   set statePickedDate(DateTime value) {
//     _pickedDate = value;
//     print(value);
//     notifyListeners();
//   }
// }
//
// class EndDate with ChangeNotifier {
//   DateTime _endDate = DateTime.now().add(Duration(days: 30));
//
//   DateTime get stateEndDate => _endDate;
//
//   set stateEndDate(DateTime value) {
//     _endDate = value;
//     notifyListeners();
//   }
// }
//
// class Gender with ChangeNotifier {
//   int _gender = 0;
//
//   int get stateGender => _gender;
//
//   set stateGender(int value) {
//     _gender = value;
//     notifyListeners();
//   }
// }
//
// class RequirementComment with ChangeNotifier {
//   String _requirementComment = '';
//
//   String get stateRequirementComment => _requirementComment;
//
//   set stateRequirementComment(String value) {
//     _requirementComment = value;
//     notifyListeners();
//   }
// }

class SubmitForm with ChangeNotifier {
  int _type;
  int _grade = 1;
  String _subject = 'Toán';
  String _address;
  List<bool> _days = List.generate(7, (index) => false);
  int _beginHour = DateTime.now().hour;
  int _beginMinute = DateTime.now().minute;
  int _endHour = DateTime.now().hour;
  int _endMinute = DateTime.now().minute;
  DateTime _beginDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  String _gender = '(Nam/Nữ)';
  String _requirement;
  double _salary = 1;
  String _phoneNumber = '0965390715';
  String _whoPost = FirebaseAuth.instance.currentUser.uid;
  bool _accepted = false;
  String _whoAccept;

  List<bool> _canBeSubmit = List.generate(5, (index) => false);

  void reset() {
    grade = 1;
    subject = 'Toán';
    address = null;
    days = List.generate(7, (index) => false);
    beginHour = DateTime.now().hour;
    endHour = DateTime.now().hour;
    beginDate = DateTime.now();
    endDate = DateTime.now();
    gender = '(Nam/Nữ)';
    type = null;
    requirement = null;
    salary = 1;
    canBeSubmit = List.generate(5, (index) => false);
    accepted = false;
    whoAccept = null;
    notifyListeners();
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
