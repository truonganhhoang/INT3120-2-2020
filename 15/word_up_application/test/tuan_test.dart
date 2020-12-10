import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_up_application/favorite_screen/favorite_words_screen.dart';
import 'package:word_up_application/main.dart';
import 'package:word_up_application/search_screen/search_word_screen.dart';
import 'package:word_up_application/selection_screen/finish_selection_screen.dart';
import 'package:word_up_application/user_profile_screen/about_me_screen.dart';
import 'package:word_up_application/user_profile_screen/user_profile_screen.dart';
import 'package:word_up_application/word.dart';
import 'package:flutter/cupertino.dart';

void main() {
  /*--- Unit test --- */
  test('test word', () {
    Word word = new Word(
      id: 1,
      word: 'hello',
    );
    String wordStr = word.wordToString();
    expect(wordStr, '1 hello');
  });

  /*--- Widget Test --- */
  testWidgets('find MaterialApp in Main', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('find Containers in FinishSelectionScreen',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: FinishSelectionScreen(),
    ));
    expect(find.byType(Container), findsWidgets);
  });

  testWidgets('check list view in Favorite Screen when no parameter',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: FavoriteWordsScreen(
    )));
    await tester.drag(find.byType(ListView), const Offset(0, -300));
    await tester.pump();
    final listTilesFinder = find.byType(ListTile);
    expect(listTilesFinder, findsNothing);
  });

  testWidgets('check button "I knew" in User Profile Screen',
      (WidgetTester tester) async {
    var button = find.byKey(ValueKey('buttonIKnew'));
    await tester.pumpWidget(MaterialApp(home: UserProfileScreen()));
    await tester.tap(button);
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
