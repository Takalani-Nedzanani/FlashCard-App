import 'package:flutter/material.dart';
import '../models/deck.dart';

class DecksProvider extends ChangeNotifier {
  final List<Deck> _decks = [];

  List<Deck> get decks => _decks;

  void addDeck({
    required String title,
    required String description,
    required List<String> tags,
  }) {
    _decks.add(Deck(
      title: title,
      description: description,
      createdAt: DateTime.now(),
      tags: tags,
      flashcards: [],
    ));
    notifyListeners();
  }
}
