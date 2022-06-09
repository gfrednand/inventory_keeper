import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_keeper/src/controllers/auth_controller.dart';
import 'package:inventory_keeper/src/controllers/profile_controller.dart';
import 'package:inventory_keeper/src/homepage/home_item_container.dart';
import 'package:inventory_keeper/src/utility/colors.dart';
import 'package:inventory_keeper/src/widgets/app_logout_menu.dart';

///Profile Screen
class ProfileScreen extends StatefulWidget {
  ///
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());
  final AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    profileController.updateUserId();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          if (controller.user.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
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
              title: const Text('Settings'),
              actions: [
                IconButton(
                  onPressed: () {
                    AppLogoutMenu().show(context);
                  },
                  icon: const Icon(Icons.more_vert_sharp),
                ),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          HomeItemContainer(
                            label: 'Profile',
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClipOval(
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl:
                                                '${controller.user['profilePhoto']}',
                                            height: 100,
                                            width: 100,
                                            placeholder: (context, url) =>
                                                const CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, dynamic error) =>
                                                    const Icon(
                                              Icons.error,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Positioned(
                                      bottom: -10,
                                      left: 210,
                                      child: IconButton(
                                        onPressed: authController.pickImage,
                                        icon: const Icon(
                                          Icons.add_a_photo,
                                          color: AppColors.blue700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                ListTile(
                                  title: const Text('Name'),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${controller.user['name']}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 14,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          HomeItemContainer(
                            label: 'Manage Team',
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    // Get.find<AuthController>().signOut();
                                  },
                                  title: const Text('Team Name'),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Text(
                                        'Watabe',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 14,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                ListTile(
                                  onTap: () {
                                    // Get.find<AuthController>().signOut();
                                  },
                                  title: const Text('Currency'),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Text(
                                        '-',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 14,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                ListTile(
                                  onTap: () {
                                    // Get.find<AuthController>().signOut();
                                  },
                                  title: const Text('Member'),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Text(
                                        '1 member',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 14,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                ListTile(
                                  onTap: () {
                                    // Get.find<AuthController>().signOut();
                                  },
                                  leading: const Icon(Icons.add),
                                  title: const Text(
                                    'Invite',
                                    style: TextStyle(color: AppColors.blue700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          HomeItemContainer(
                            label: 'Team Settings',
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () {},
                                  title: const Text('My Team'),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    // Get.find<AuthController>().signOut();
                                  },
                                  leading: const Icon(Icons.add),
                                  title: const Text(
                                    'Add New Team',
                                    style: TextStyle(color: AppColors.blue700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          HomeItemContainer(
                            label: 'Paterner Settings',
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    // Get.find<AuthController>().signOut();
                                  },
                                  title: const Text('Supplier'),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Text(
                                        '0 supplier',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 14,
                                      )
                                    ],
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    // Get.find<AuthController>().signOut();
                                  },
                                  title: const Text('Vendor'),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Text(
                                        '0 vendor',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 14,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Vesrion 0.0.1',
                              style: GoogleFonts.indieFlower(fontSize: 20),
                            ),
                          ),
                          // ListTile(
                          //   onTap: () {
                          //     Get.find<AuthController>().signOut();
                          //   },
                          //   title: const Text('Sign Out'),
                          //   trailing: const Icon(
                          //     Icons.arrow_forward_ios,
                          //     size: 16,
                          //   ),
                          // ),

                          const SizedBox(
                            height: 25,
                          ),
                          // video list
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
