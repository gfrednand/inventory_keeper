import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/team/add_team_page.dart';

/// Team Creation
class TeamInitialPage extends StatelessWidget {
  /// Team Creation Constructor
  const TeamInitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Create Team'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Join or Create New Team',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Create a new Team or Join an existing Team'),
            ),
            const SizedBox(height: 24),
            Card(
              child: ListTile(
                onTap: () => Get.to<void>(AddTeamPage()),
                leading: const Icon(Icons.new_label_outlined),
                title: const Text('Create Team'),
                subtitle:
                    const Text('Create a team and start inventory management'),
              ),
            ),
            const SizedBox(height: 16),
            const Card(
              child: ListTile(
                leading: Icon(Icons.join_left),
                title: Text('Join a Team'),
                subtitle: Text('Join Existing team ia invitation code'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
