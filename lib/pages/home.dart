import 'package:chatting_app_flutter/pages/chatpage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController searchController;

  final List<Map<String, dynamic>> users = [
    {
      "name": "Shivam Gupta",
      "message": "Hello, What are you doing?",
      "time": "04:30 PM"
    },
    {
      "name": "kajal Sharma",
      "message": "Hey, What is going on?",
      "time": "05:30 PM"
    },
    {
      "name": "Pooja Sharma",
      "message": "Hello, How was your day?",
      "time": "10:30 AM"
    },
    {"name": "Divya Singh", "message": "Hello, Shivam!", "time": "12:30 AM"},
  ];

  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF553370),
      body: Container(
        child: Column(
          children: [
            _buildAppBar(),
            _buildUserList(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "ChatUp",
            style: TextStyle(
                color: Color(0Xffc199cd),
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: const Color(0xFF3a2144),
                borderRadius: BorderRadius.circular(20)),
            child: IconButton(
              tooltip: "Search users name....",
              color: Color(0Xffc199cd),
              onPressed: () {
                showSearch(
                    context: context, delegate: UserSearchDelegate(users));
              },
              icon: const Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserList() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return buildUserCard(users[index]);
          },
        ),
      ),
    );
  }

  Widget buildUserCard(Map<String, dynamic> userData) {
    return GestureDetector(
      onTap: () {
        // Navigate to ChatPage and pass user-specific data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              userName: userData["name"],
              // You can pass more user-specific data here if needed
            ),
          ),
        );
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: CircleAvatar(
                  child: Image.asset(
                    "images/kk.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        userData["name"],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    userData["message"],
                    style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                userData["time"],
                style: const TextStyle(
                  color: Colors.black45,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}

class UserSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> users;

  UserSearchDelegate(this.users);

  @override
  List<Widget> buildActions(BuildContext context) {
    HSLColor.fromColor(Colors.blue);
    return [
      IconButton(
        tooltip: "clear",
        color: Colors.black,
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.highlight_remove_rounded),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: "Back",
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final List<Map<String, dynamic>> searchResults = users.where(
      (user) {
        final String name = user['name'].toLowerCase();
        final String queryLower = query.toLowerCase();
        return name.contains(queryLower);
      },
    ).toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index]['name']),
          onTap: () {
            // Handle tap on search result
            close(context, '');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  userName: searchResults[index]['name'],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
