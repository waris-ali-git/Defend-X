import 'package:flutter/material.dart';
import 'package:next_pg/Attacks_map.dart';

void main() {
  runApp(DefendXDashboard());
}

class DefendXDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Row(
          children: [
            Sidebar(), // Sidebar navigation menu
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderSection(),
                    SystemStatus(),
                    RecentActivity(),
                    AIAnalysisReport(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      color: Colors.black54,
      child: Column(
        children: [
          SizedBox(height: 20),
          IconButton(
            icon: Icon(Icons.map, color: Colors.grey, size: 30),
            onPressed: () {
              // Navigate to the AttacksMap page when the icon is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>AttacksMap()), // Navigate to AttacksMap page
              );
            },
          ),
          SizedBox(height: 20),
          // Add other icons for different pages here
        ],
      ),
    );
  }
}

/// Dashboard screen
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DefendX Dashboard')),
      body: Row(
        children: [
          Sidebar(), // Sidebar navigation menu
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderSection(),
                  SystemStatus(),
                  RecentActivity(),
                  AIAnalysisReport(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
/// Settings Screen
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(child: Text('Settings Page')),
    );
  }
}

/// Profile Screen
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(child: Text('Profile Page')),
    );
  }
}

/// Header Section Widget
class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DefendX',
              style: TextStyle(
                color: Colors.red,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Critical: Unauthorized access attempt blocked.',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              'Urgent: Malware detected in system core.',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              'Warning: Unusual data transfer activity.',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// Rest of the widgets (SystemStatus, RecentActivity, AIAnalysisReport) remain the same


/// System Status Widget
/// Displays system resource usage information
class SystemStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'System Status',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatusCard(label: 'CPU Usage', value: '3.4 GHz', percentage: '16%'),
              StatusCard(label: 'Memory Usage', value: '16 GB', percentage: '72%'),
              StatusCard(label: 'Disk Usage', value: '500 GB', percentage: '80%'),
            ],
          ),
        ],
      ),
    );
  }
}

/// Status Card Widget
/// Represents a single system resource usage metric
class StatusCard extends StatelessWidget {
  final String label;
  final String value;
  final String percentage;

  StatusCard({
    required this.label,
    required this.value,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          Text(
            percentage,
            style: TextStyle(fontSize: 14, color: Colors.redAccent),
          ),
        ],
      ),
    );
  }
}

/// Recent Activity Widget
/// Displays a list of recent events with timestamps and confidence levels
class RecentActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Activity',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ActivityCard(type: 'Alert', message: 'Critical threat detected.', time: '15:34', confidence: '98%'),
              ActivityCard(type: 'Warning', message: 'Potential vulnerability found.', time: '14:50', confidence: '75%'),
              ActivityCard(type: 'Safe', message: 'System operating normally.', time: '13:25', confidence: '100%'),
              ActivityCard(type: 'Info', message: 'Routine scan completed.', time: '12:10', confidence: '95%'),
            ],
          ),
        ],
      ),
    );
  }
}

/// Activity Card Widget
/// Represents a single recent activity event
class ActivityCard extends StatelessWidget {
  final String type;
  final String message;
  final String time;
  final String confidence;

  ActivityCard({
    required this.type,
    required this.message,
    required this.time,
    required this.confidence,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            type,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _getColorByType(type)),
          ),
          SizedBox(height: 10),
          Text(
            message,
            style: TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Time: $time',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          Text(
            'Confidence: $confidence',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Color _getColorByType(String type) {
    switch (type) {
      case 'Alert':
        return Colors.red;
      case 'Warning':
        return Colors.yellow;
      case 'Safe':
        return Colors.green;
      case 'Info':
        return Colors.blue;
      default:
        return Colors.white;
    }
  }
}

/// AI Analysis Report Widget
/// Displays insights generated by AI analysis
class AIAnalysisReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AI Analysis Report',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ReportCard(
                title: 'Red Incident',
                description: 'Critical vulnerability detected in server firewall.',
                timestamp: '2023-10-23 14:30',
                riskLevel: '95%',
              ),
              ReportCard(
                title: 'Yellow Alert',
                description: 'Suspicious login attempt from new device.',
                timestamp: '2023-10-23 12:15',
                riskLevel: '70%',
              ),
              ReportCard(
                title: 'Green Check',
                description: 'Routine system check completed successfully.',
                timestamp: '2023-10-23 10:00',
                riskLevel: '100%',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Report Card Widget
/// Represents a single AI analysis report item
class ReportCard extends StatelessWidget {
  final String title;
  final String description;
  final String timestamp;
  final String riskLevel;

  ReportCard({
    required this.title,
    required this.description,
    required this.timestamp,
    required this.riskLevel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink),
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Timestamp: $timestamp',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          Text(
            'Risk Level: $riskLevel',
            style: TextStyle(fontSize: 12, color: Colors.redAccent),
          ),
        ],
      ),
    );
  }
}
