import 'package:flutter/material.dart';
import '../models/deck.dart';

class DeckScreen extends StatelessWidget {
  final Deck deck;

  const DeckScreen({Key? key, required this.deck}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(deck.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              deck.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Created at: ${deck.createdAt.toLocal()}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              children: deck.tags
                  .map((tag) => Chip(
                        label: Text(tag),
                        backgroundColor: Colors.blueAccent.withOpacity(0.1),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),
            deck.flashcards.isEmpty
                ? Center(
                    child: Text(
                      'No flashcards in this deck. Add some flashcards!',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: deck.flashcards.length,
                      itemBuilder: (context, index) {
                        final flashcard = deck.flashcards[index];
                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: ListTile(
                            title: Text(flashcard.question),
                            subtitle: Text(flashcard.answer),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
