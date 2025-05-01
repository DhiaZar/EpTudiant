import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EpTudiant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: "EpTudiant"),
        '/second': (context) => const SecondPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _textInput = '';
  final TextEditingController _textController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.indigo, title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------------------------------
            // 1. Text Widget
            // -------------------------------
            const Text(
              'Text Widget',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),

            // -------------------------------
            // 2. Text Input (TextBox)
            // -------------------------------
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'TextBox widget',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _textInput = value;
                });
              },
            ),
            const SizedBox(height: 10),
            Text('You typed: $_textInput'), //Pour afficher ce qu'on a ecrit
            const SizedBox(height: 20),

            // -------------------------------
            // 3. Basic Button
            // -------------------------------
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Button pressed! You typed: $_textInput'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                backgroundColor: Colors.greenAccent,
              ),
              child: const Text('Elevated Button'),
            ),
            const SizedBox(height: 20),
//farah
            // -------------------------------
            // 4. Button with Image
            // -------------------------------
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Button with image pressed!')),
                );
              },
              icon: Image.asset(
                'assets/flutter_logo.png', // Replace with your image path
                width: 24,
                height: 24,
              ),
              label: const Text('Button with Image'),
            ),

            // Alternative: Image inside TextButton
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Button with image and text pressed!'),
                  ),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    'https://picsum.photos/50', // Example network image
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 8),
                  const Text('TextButton with Image'),
                ],
              ),
            ),
            ElevatedButton(
              //Ceci est un element Bouton
              child: const Text('Go to second page'), // Le text contenu
              style: ElevatedButton.styleFrom(
                //son style (taille,forme,couleur)
                shape: CircleBorder(),
                backgroundColor: Colors.deepPurpleAccent,
                padding: const EdgeInsets.all(40),
              ),
              onPressed: () {
                // fonction ou methode appele a la pression du bouton
                Navigator.pushNamed(
                  context,
                  '/second',
                ); //Le mouvement vers la page '/second'
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*
The next code is related to the second page
Meaning that more pages can be added in the same Main file as other classes
Then said pages should be added in the routing on Line 18
*/
class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPage();
}

class _SecondPage extends State<SecondPage> {
  String? _selectedItem;

  final List<String> _items = ['Item1', 'Item2', 'Item3', 'Item4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://static01.nyt.com/images/2016/08/05/us/05onfire1_xp/05onfire1_xp-superJumbo-v2.jpg",
            ),
            const Text('Welcome to the Second Page!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Return to previous page
              },
              child: const Text('Go Back'),
            ),
            DropdownButton<String>(
              value: _selectedItem,
              hint: Text("This is a hint talking about the drop down"),
              items:
                  _items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedItem = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
