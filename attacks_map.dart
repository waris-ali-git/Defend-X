import 'package:flutter/material.dart';

class AttacksMap extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 80,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Icon(Icons.dashboard, color: Colors.white, size: 30),
                const SizedBox(height: 30),
                Icon(Icons.map, color: Colors.red, size: 30),
                const SizedBox(height: 30),
                Icon(Icons.warning, color: Colors.white, size: 30),
                const SizedBox(height: 30),
                Icon(Icons.business, color: Colors.white, size: 30),
                const Spacer(),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/profile.jpg'), // Add your profile image
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // Main content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Map section
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/map.jpg'), // Add your map image
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Pins (example positions)
                      Positioned(
                        left: 100,
                        top: 150,
                        child: Icon(Icons.place, color: Colors.red, size: 40),
                      ),
                      Positioned(
                        left: 200,
                        top: 300,
                        child: Icon(Icons.place, color: Colors.red, size: 40),
                      ),
                      Positioned(
                        right: 120,
                        bottom: 100,
                        child: Icon(Icons.place, color: Colors.blue, size: 30),
                      ),
                    ],
                  ),
                ),

                // Alert section
                Container(
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Type: DDoS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Severity: Critical',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Description: A distributed denial-of-service attack aimed at overwhelming the server with excessive requests.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
}
}