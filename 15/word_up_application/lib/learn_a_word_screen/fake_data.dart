import 'package:word_up_application/word.dart';

final Word word1 = Word(
  id: 1,
  word: 'Modern',
  type: 'adj',
  definition: 'Designed and made using the most recent ideas and methods',
  meanCard: 'Hiện đại',
  examples: [
    '- modern technology/education/art/transport.',
    '- We\'re in the very modern-looking building opposite the station.'
  ],
  pathSoundUK: 'assets/audios/modern_UK.mp3',
  pathSoundUS: 'pathSoundUS',
  pronounceUS: '/ˈmɒd.ən/',
  pronounceUK: '/ˈmɒd.ən/',
  imagePaths: ['assets/images/modern.jpg'],
  quotes: ['This house is more modern than that house'],
  isFavorite: false,
);
final Word word2 = Word(
  id: 1,
  word: 'Modern',
  type: 'noun',
  definition:
      'of the present or recent times, especially the period of history since around 1500',
  meanCard: 'Mới mẻ',
  examples: [
    '- What do you think is the role of religion in the modern world?',
    '- Taste is a complex, modern phenomenon that can be understood in a number of ways.'
  ],
  pathSoundUK: 'assets/audios/modern_UK.mp3',
  pathSoundUS: 'pathSoundUS',
  pronounceUS: '/ˈmɒd.ən/',
  pronounceUK: '/ˈmɒd.ən/',
  imagePaths: ['assets/images/modern1.jpg'],
  quotes: ['This house is more modern than that house'],
  isFavorite: true,
);
final Word word3 = Word(
  id: 1,
  word: 'Modern',
  type: 'verb',
  definition:
      'existing in the present or using or based on recently developed ideas, methods, or styles',
  meanCard: 'Tân tiến',
  examples: [
    '- In the early modern period some significant themes emerge.',
    '- The main appeal of the modern reader is that it tells the story so well.'
  ],
  pathSoundUK: 'assets/audios/modern_UK.mp3',
  pathSoundUS: 'pathSoundUS',
  pronounceUS: '/ˈmɒd.ən/',
  pronounceUK: '/ˈmɒd.ən/',
  imagePaths: ['assets/images/modern2.jpg'],
  quotes: ['This house is more modern than that house'],
  isFavorite: false,
);

final words = [word1, word2, word3];
