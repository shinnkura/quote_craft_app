import 'dart:math';
import 'package:flutter/material.dart';
import 'quote_preferences.dart';
import 'quotes_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('名言自動生成')),
        body: QuoteScreen(),
      ),
    );
  }
}

class QuoteScreen extends StatefulWidget {
  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  String _currentQuote = '';

  @override
  void initState() {
    super.initState();
    _generateNewQuote();
  }

  void _generateNewQuote() async {
    int lastIndex = await QuotePreferences.getLastQuoteIndex();
    int newIndex;
    do {
      newIndex = Random().nextInt(quotes.length);
    } while (newIndex == lastIndex);
    await QuotePreferences.setLastQuoteIndex(newIndex);
    setState(() {
      _currentQuote = quotes[newIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              _currentQuote,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: _generateNewQuote,
            child: Text('新しい名言を生成'),
          ),
        ],
      ),
    );
  }
}
