import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:inventory_keeper/src/controllers/index.dart';

/// Team Members Page
class TeamMembersPage extends StatelessWidget {
  ///
  const TeamMembersPage({Key? key}) : super(key: key);

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
        title: const Text('Members'),
        actions: [TextButton(onPressed: () {}, child: const Text('Invite'))],
      ),
      body: GetBuilder<UserController>(
        builder: (cont) {
          final teamMebers = UserController.instance.teamMembers;
          if (teamMebers.isEmpty) {
            return const Center(
              child: Text('No Member'),
            );
          }

          return ListView.builder(
            itemCount: teamMebers.length,
            itemBuilder: (context, index) => ListTile(
              leading: teamMebers[index].photoUrl == null
                  ? const Icon(Icons.face_outlined)
                  : CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                        teamMebers[index].photoUrl!,
                        maxHeight: 100,
                        maxWidth: 100,
                      ),
                    ),
              title: Text(teamMebers[index].fullname),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 14,
              ),
            ),
          );
        },
      ),
    );
  }
}
