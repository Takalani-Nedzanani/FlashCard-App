import 'flashcard.dart';

class Deck {
  final String title;
  final String description;
  final DateTime createdAt;
  final List<String> tags;
  final List<Flashcard> flashcards;

  Deck({
    required this.title,
    required this.description,
    required this.createdAt,
    required this.tags,
    required this.flashcards,
  });
}
