import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_keeper/src/controllers/partner_controller.dart';
import 'package:inventory_keeper/src/models/partner/partner.dart';
import 'package:inventory_keeper/src/widgets/custom_form_field.dart';

/// Partner (Supplier and Vendors)
class PartnerListView extends StatelessWidget {
  ///
  const PartnerListView({Key? key, required this.type}) : super(key: key);

  /// Partner Type
  final PartnerType type;
  @override
  Widget build(BuildContext context) {
    final partnerController = Get.find<PartnerController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text('Select ${type.name}'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: Hero(
                    tag: 'hero-parterner-title',
                    child: Material(
                      child: CustomFormField(
                        keyboardType: TextInputType.text,
                        controller: partnerController.nameController,
                        label: type.name,
                        validator: (value) {
                          if (value == null) {
                            return 'Please provide ${type.name} name';
                          }
                          return null;
                        },
                        inputAction: TextInputAction.done,
                        focusNode: partnerController.nameFocusNode,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                // we need add button at last friends row
                ElevatedButton(
                  onPressed: () => partnerController.addPartner(type),
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<PartnerController>(
              builder: (cont) {
                final data = partnerController.partners
                    .where((p) => p.type.name == type.name)
                    .toList();
                if (data.isEmpty) {
                  return const Center(
                    child: Text('Nothing here'),
                  );
                }
                return ListView.builder(
                  restorationId: 'productTypeListView',
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = data[index];
                    return ListTile(
                      title: Text(item.name),
                      trailing: TextButton(
                        onPressed: () => partnerController.removePartner(item),
                        child: const Text(
                          'Delete',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      onTap: () {
                        // Navigator.restorablePushNamed(
                        //   context,
                        //   ProductDetailsView.routeName,
                        // );
                        partnerController.changeType(item);
                        Get.back<void>();
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
