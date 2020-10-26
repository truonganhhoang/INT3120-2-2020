import 'package:EduBox/package/widget.dart';
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
  int _grade = 0;
  int _subject = 0;
  String _address;
  List<bool> _days = List.generate(7, (index) => false);
  int _beginHour = DateTime.now().hour;
  int _endHour = DateTime.now().hour;
  DateTime _beginDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  int _gender = 0;
  String _requirement;
  double _salary;

  int get grade => _grade;

  set grade(int value) {
    _grade = value;
    notifyListeners();
  }

  int get subject => _subject;

  set subject(int value) {
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
    notifyListeners();
  }

  int get endHour => _endHour;

  set endHour(int value) {
    _endHour = value;
    notifyListeners();
  }

  DateTime get beginDate => _beginDate;

  set beginDate(DateTime value) {
    _beginDate = value;
    notifyListeners();
  }

  DateTime get endDate => _endDate;

  set endDate(DateTime value) {
    _endDate = value;
    notifyListeners();
  }

  int get gender => _gender;

  set gender(int value) {
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

//StreamController

}
