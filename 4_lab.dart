import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Lab 4 - All Tasks',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const HomeScreen(),
    );
  }
}

// -------------------- HOME SCREEN --------------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4 Tasks'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _TaskTile(
            title: 'Task 1: Settings (Switch & Checkbox)',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Task1Settings()),
            ),
          ),
          _TaskTile(
            title: 'Task 2: Login Form (TextField & Validation)',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Task2Login()),
            ),
          ),
          _TaskTile(
            title: 'Task 3: Counter (FAB & OutlinedButton)',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Task3Counter()),
            ),
          ),
          _TaskTile(
            title: 'Task 4: Feedback (Progress & SnackBar)',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Task4Feedback()),
            ),
          ),
          _TaskTile(
            title: 'Task 5: Dialogs (AlertDialog & BottomSheet)',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Task5Dialogs()),
            ),
          ),
          _TaskTile(
            title: 'Task 6: Sliders & Pickers',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Task6Sliders()),
            ),
          ),
          _TaskTile(
            title: 'Task 7: ListView (Builder & Dismissible)',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Task7List()),
            ),
          ),
          _TaskTile(
            title: 'Task 8: GridView (Count & InkWell)',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Task8Grid()),
            ),
          ),
          _TaskTile(
            title: 'Task 9: Navigation (BottomNavigationBar)',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Task9BottomNav()),
            ),
          ),
          _TaskTile(
            title: 'Task 9b: Navigation (TabBar & TabBarView)',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Task9TopTabs()),
            ),
          ),
        ],
      ),
    );
  }
}

class _TaskTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _TaskTile({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

// -------------------- TASK 1 --------------------
class Task1Settings extends StatefulWidget {
  const Task1Settings({super.key});

  @override
  State<Task1Settings> createState() => _Task1SettingsState();
}

class _Task1SettingsState extends State<Task1Settings> {
  bool darkMode = false;
  bool agreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 1: Settings'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Agree to Terms'),
            value: agreed,
            onChanged: (value) {
              setState(() {
                agreed = value ?? false;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: agreed
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Button pressed')),
                      );
                    }
                  : null,
              child: const Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------- TASK 2 --------------------
class Task2Login extends StatefulWidget {
  const Task2Login({super.key});

  @override
  State<Task2Login> createState() => _Task2LoginState();
}

class _Task2LoginState extends State<Task2Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@')) {
      return 'Email must contain @ symbol';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 2: Login Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: _validateEmail,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                obscureText: _obscurePassword,
                validator: _validatePassword,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// -------------------- TASK 3 --------------------
class Task3Counter extends StatefulWidget {
  const Task3Counter({super.key});

  @override
  State<Task3Counter> createState() => _Task3CounterState();
}

class _Task3CounterState extends State<Task3Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 3: Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 24),
            OutlinedButton(
              onPressed: _reset,
              child: const Text('Reset to 0'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// -------------------- TASK 4 --------------------
class Task4Feedback extends StatefulWidget {
  const Task4Feedback({super.key});

  @override
  State<Task4Feedback> createState() => _Task4FeedbackState();
}

class _Task4FeedbackState extends State<Task4Feedback> {
  bool _isLoading = false;

  Future<void> _showProgressAndSnackBar() async {
    setState(() {
      _isLoading = true;
    });

    // Show progress for 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;
    setState(() {
      _isLoading = false;
    });

    // Show SnackBar with Undo action
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Operation completed'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Undo triggered')),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 4: Feedback'),
      ),
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: _isLoading ? null : _showProgressAndSnackBar,
              child: const Text('Start Operation'),
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}

// -------------------- TASK 5 --------------------
class Task5Dialogs extends StatelessWidget {
  const Task5Dialogs({super.key});

  Future<void> _showDeleteDialog(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Item'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(confirmed == true ? 'Item deleted' : 'Delete canceled'),
        ),
      );
    }
  }

  void _showShareBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Share'),
                onTap: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Share selected')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.copy),
                title: const Text('Copy Link'),
                onTap: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Copy Link selected')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Email'),
                onTap: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Email selected')),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 5: Dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => _showDeleteDialog(context),
              child: const Text('Delete Item'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _showShareBottomSheet(context),
              child: const Text('Show Share Options'),
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------- TASK 6 --------------------
class Task6Sliders extends StatefulWidget {
  const Task6Sliders({super.key});

  @override
  State<Task6Sliders> createState() => _Task6SlidersState();
}

class _Task6SlidersState extends State<Task6Sliders> {
  double _volume = 0.5;
  DateTime? _selectedDate;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'No date selected';
    // Simple formatting
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final volumePercent = (_volume * 100).round();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 6: Sliders & Pickers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Volume Control'),
            Slider(
              value: _volume,
              onChanged: (value) {
                setState(() {
                  _volume = value;
                });
              },
            ),
            Text('$volumePercent%'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _pickDate,
              child: const Text('Select Date'),
            ),
            const SizedBox(height: 16),
            Text(_formatDate(_selectedDate)),
          ],
        ),
      ),
    );
  }
}

// -------------------- TASK 7 --------------------
class Task7List extends StatefulWidget {
  const Task7List({super.key});

  @override
  State<Task7List> createState() => _Task7ListState();
}

class _Task7ListState extends State<Task7List> {
  final List<String> _items = List.generate(
    20,
    (index) => 'Item ${index + 1}',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 7: ListView & Dismissible'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return Dismissible(
            key: Key(item),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 16),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (_) {
              setState(() {
                _items.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$item dismissed')),
              );
            },
            child: ListTile(
              title: Text(item),
            ),
          );
        },
      ),
    );
  }
}

// -------------------- TASK 8 --------------------
class Task8Grid extends StatelessWidget {
  const Task8Grid({super.key});

  void _showPreview(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.accents[index % Colors.accents.length],
                  child: Center(
                    child: Text(
                      'Preview ${index + 1}',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 8: GridView'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        children: List.generate(20, (index) {
          final color = Colors.primaries[index % Colors.primaries.length];
          return InkWell(
            onTap: () => _showPreview(context, index),
            child: Container(
              color: color.withOpacity(0.7),
              child: Center(
                child: Text(
                  'Item ${index + 1}',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// -------------------- TASK 9a: BOTTOM NAVIGATION --------------------
class Task9BottomNav extends StatefulWidget {
  const Task9BottomNav({super.key});

  @override
  State<Task9BottomNav> createState() => _Task9BottomNavState();
}

class _Task9BottomNavState extends State<Task9BottomNav> {
  int _currentIndex = 0;

  final List<Widget> _views = const [
    _NavView(title: 'Home View'),
    _NavView(title: 'Search View'),
    _NavView(title: 'Profile View'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 9: BottomNavigationBar'),
      ),
      body: _views[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _NavView extends StatelessWidget {
  final String title;
  const _NavView({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}

// -------------------- TASK 9b: TOP TABS --------------------
class Task9TopTabs extends StatelessWidget {
  const Task9TopTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Task 9b: TabBar & TabBarView'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Photos'),
              Tab(text: 'Videos'),
              Tab(text: 'Documents'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _TabView(title: 'Photos Content'),
            _TabView(title: 'Videos Content'),
            _TabView(title: 'Documents Content'),
          ],
        ),
      ),
    );
  }
}

class _TabView extends StatelessWidget {
  final String title;
  const _TabView({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}