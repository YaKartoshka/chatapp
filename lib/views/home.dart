import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> chats = [
    {
      'username': 'John Doe',
      'lastMessage': 'Hey, how are you?',
      'time': '10:30 AM',
    },
    {
      'username': 'Jane Smith',
      'lastMessage': 'Did you finish the project?',
      'time': '11:45 AM',
    },
    {
      'username': 'Michael Johnson',
      'lastMessage': 'Let\'s grab lunch later!',
      'time': '12:15 PM',
    },
    // Add more chat data here
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Чаты',
          style: TextStyle(
              fontSize: 30, fontFamily: 'Gilroy', fontWeight: FontWeight.w100),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Поиск...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onChanged: (value) {
                  print('Search query: $value');
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(chat['username'][0]),
                    ),
                    title: Text(chat['username']),
                    subtitle: Text(chat['lastMessage']),
                    trailing: Text(chat['time']),
                    onTap: () {
                      // Navigate to the chat screen for the selected user
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
