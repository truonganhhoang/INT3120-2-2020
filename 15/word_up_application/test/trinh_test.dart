import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:share/share.dart';
import 'package:word_up_application/chat_screen/chat_screen.dart';
import 'package:word_up_application/components/star_favorite.dart';
import 'package:word_up_application/game_screen/game_box.dart';
import 'package:word_up_application/game_screen/play_game_screen.dart';
import 'package:word_up_application/home/account_page.dart';
import 'package:word_up_application/learn_a_word_screen/fake_data.dart';
import 'package:word_up_application/learn_a_word_screen/learn_a_word_screen.dart';
import 'package:word_up_application/learn_a_word_screen/learn_box.dart';

import 'package:word_up_application/main.dart';
import 'package:word_up_application/selection_screen/finish_selection_screen.dart';
import 'package:word_up_application/study_home_screen/study_home_screen.dart';
import 'package:word_up_application/word.dart';

void main() {
  /*--- Unit test --- */
  // Test Finish Selection Screen
  test('test Finish Selection Screen', () {
    var screen = FinishSelectionScreen(n: 15);
    expect(screen.n, 15);
  });

  // Test LearnAWord Screen
  test('LearnAWord Screen', () {
    var screen = LearnAWord(word: word);
    expect(screen.word.quotes[0], 'This house is more modern than that house');
  });

  // Test LearnBox Screen
  test('Learn Box Screen', () {
    var screen = LearnBox(
      word: word,
      index: 0,
    );
    expect(screen.word.word, 'Modern');
    expect(screen.word.type, 'adj');
    expect(screen.word.definition,
        'Designed and made using the most recent ideas and methods');
    expect(screen.word.meanCard, 'Hiện đại');
    expect(screen.word.examples[2 * screen.index],
        '- modern technology/education/art/transport.');
    expect(screen.word.examples[2 * screen.index + 1],
        '- We\'re in the very modern-looking building opposite the station.');
    expect(screen.word.pathSoundUK, 'assets/audios/modern_UK.mp3');
    expect(screen.word.imagePaths[screen.index], 'assets/images/modern.jpg');
    expect(screen.word.quotes[0], 'This house is more modern than that house');
    expect(screen.word.isFavorite, false);
  });

  /*--- Widget Test --- */
  // Test GameScreen
  testWidgets('find Widgets in GameScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: PlayGameScreen(),
    ));
    expect(find.byType(SingleChildScrollView), findsWidgets);
    expect(find.byType(ListView), findsWidgets);
  });

  // Test ChatScreen
  testWidgets('Send message in ChatScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ChatScreen(),
    ));
    expect(find.byType(IconTheme), findsWidgets);
    expect(find.byType(Flexible), findsWidgets);
    expect(find.text("Chat Bot"), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'hi');
    var button1 = find.byKey(ValueKey('Send'));
    await tester.press(button1);
    expect(find.text('hi'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'UET');
    var button2 = find.byKey(ValueKey('Send'));
    await tester.press(button2);
    expect(find.text('UET'), findsOneWidget);
  });
}
