import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomWords(title: 'StartUp Name Generator'),
    );
  }
}

class RandomWords extends StatefulWidget {
  RandomWords({Key key, this.title}) : super(key: key);
  final String title;

  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _wordPairs = List();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: _buildNameSuggestions(),
    );
  }


  Widget _buildNameSuggestions() {
    return ListView.builder(itemBuilder: (_, i) {
      if (i.isOdd) {
        return Divider();
      }

      final int index = i ~/ 2;
      // If you've reached the end of the available word
      // pairings...
      if (index >= _wordPairs.length) {
        // ...then generate 10 more and add them to the
        // suggestions list.
        _wordPairs.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_wordPairs[index]);
    });
  }

  Widget _buildRow(WordPair wordPair) {
    return ListTile(title: Text(
      wordPair.asPascalCase,
      style: _biggerFont,
    ),
    );
  }
}
