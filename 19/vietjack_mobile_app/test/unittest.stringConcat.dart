import 'package:flutter_test/flutter_test.dart';
import 'package:vietjack_mobile_app/DetailSubject.dart';
void main(){
  test("test name weekly subject",(){
    expect("Sóng",DetailSubject.getTitle("  Sóng ( Xuân Quỳnh ) "));
    expect("Sóng",DetailSubject.getTitle("Sóng (Xuân Quỳnh ) "));
    expect("Sóng",DetailSubject.getTitle("Sóng(Xuân Quỳnh)"));
  });
  test("test name subtitle weekly subject",(){
    expect("Xuân Quỳnh",DetailSubject.getSubtitle("Sóng ( Xuân Quỳnh     ) "));
    expect("Xuân Quỳnh",DetailSubject.getSubtitle("Sóng ( Xuân Quỳnh     ) "));
    expect("Xuân Quỳnh",DetailSubject.getSubtitle("Sóng ( Xuân Quỳnh     ) "));
  });

}