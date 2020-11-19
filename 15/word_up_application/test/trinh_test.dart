import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_up_application/chat_screen/chat_screen.dart';
import 'package:word_up_application/home/account_page.dart';
import 'package:word_up_application/learn_a_word_screen/fake_data.dart';
import 'package:word_up_application/learn_a_word_screen/learn_a_word_screen.dart';
import 'package:word_up_application/learn_a_word_screen/learn_box.dart';

import 'package:word_up_application/main.dart';
import 'package:word_up_application/selection_screen/finish_selection_screen.dart';

void main() {
  // Test FinishSelection Screen
  testWidgets('Finish Selection Screen', (WidgetTester tester) async {
    var screen = FinishSelectionScreen(n: 15);
    expect(screen.n, 15);
  });

  // Test LearnBox Screen
  testWidgets('Learn Box Screen', (WidgetTester tester) async {
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

}
