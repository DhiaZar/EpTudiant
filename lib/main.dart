import 'package:flutter/material.dart';

// commentaire Ranim

//commentaire wiwi

// Commentaire Dhia
// un deuxieme commentaire


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
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/second': (context) => const SecondPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _textInput = '';
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EpTudiant'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text Widget
            _buildSectionTitle('Text Widget'),
            const SizedBox(height: 20),

            // Text Input
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Enter text',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey,
              ),
              onChanged: (value) => setState(() => _textInput = value),
            ),
            const SizedBox(height: 10),
            Text('You typed: $_textInput', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 20),

            // Basic Button
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Button pressed! You typed: $_textInput')),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
              child: const Text('Elevated Button'),
            ),
            const SizedBox(height: 20),
<<<<<<< HEAD
//farah
            // -------------------------------
            // 4. Button with Image
            // -------------------------------
=======

            // Button with Image
>>>>>>> 0397225fee19ea4c7b31dfa84ffc59f7109ee873
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Button with image pressed!')),
                );
              },
              icon: const Icon(Icons.image, size: 24), // Replaced with icon for simplicity
              label: const Text('Button with Icon'),
            ),
            const SizedBox(height: 20),

            // Navigation Button
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/second'),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: Colors.deepPurpleAccent,
                padding: const EdgeInsets.all(40),
              ),
              child: const Text('Go to Second Page'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String? _selectedItem;
  final List<String> _items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://static01.nyt.com/images/2016/08/05/us/05onfire1_xp/05onfire1_xp-superJumbo-v2.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, size: 50),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Welcome to the Second Page!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                value: _selectedItem,
                hint: const Text('Select an item'),
                isExpanded: true,
                items: _items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) => setState(() => _selectedItem = newValue),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}