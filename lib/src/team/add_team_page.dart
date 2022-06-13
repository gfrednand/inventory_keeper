import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/team_controller.dart';
import 'package:inventory_keeper/src/homepage/home_item_container.dart';
import 'package:inventory_keeper/src/models/team/team.dart';
import 'package:inventory_keeper/src/utility/colors.dart';
import 'package:inventory_keeper/src/widgets/custom_form_field.dart';

///
class AddTeamPage extends StatelessWidget {
  ///
  AddTeamPage({Key? key}) : super(key: key);
  final TextEditingController _teamNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
        title: const Text('Create Team Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: HomeItemContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomFormField(
                  controller: _teamNameController,
                  inputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  label: 'Team Name',
                  focusNode: FocusNode(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GetBuilder<TeamController>(builder: (cont) {
                return Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: AppColors.blue700,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: TeamController.instance.busy
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : InkWell(
                          onTap: () => TeamController.instance.registerTeam(
                            Team(
                              name: _teamNameController.text,
                              lastUpdatedAt:
                                  DateTime.now().millisecondsSinceEpoch,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Create Team',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                );
              }),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
