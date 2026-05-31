import 'package:expense_tracker/features/add_expense/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_iconpicker/Models/configuration.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

Future<CategoryModel?> addCategoryDialog(BuildContext context) async {
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  IconData? selectedIcon;
  Color selectedColor = Colors.blue;
  bool isIconError = false;
  return showDialog<CategoryModel>(
    context: context,
    builder: (dialogContext) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Text('Add Category'),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'Category Name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a category name';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () async {
                            final icon = await showIconPicker(
                              context,
                              configuration: SinglePickerConfiguration(
                                iconPackModes: [
                                  IconPack.material,
                                  IconPack.cupertino,
                                  IconPack.fontAwesomeIcons,
                                ],
                              ),
                            );
                            if (icon != null) {
                              setState(() {
                                selectedIcon = icon.data;
                              });
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: selectedIcon == null
                                    ? Colors.grey
                                    : Theme.of(context).primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(selectedIcon ?? Icons.add_circle_outline),
                                const SizedBox(width: 12),
                                Text(
                                  selectedIcon == null
                                      ? 'Choose Icon'
                                      : 'Icon Selected',
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),
                        InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () async {
                            Color tempColor = selectedColor;
                            await showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                contentPadding: const EdgeInsets.all(16),
                                title: const Text('Choose Color'),
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                    pickerColor: tempColor,
                                    onColorChanged: (color) {
                                      tempColor = color;
                                    },
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedColor = tempColor;
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Done'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 12,
                                  backgroundColor: selectedColor,
                                ),
                                const SizedBox(width: 12),
                                const Text('Choose Color'),
                              ],
                            ),
                          ),
                        ),

                        if (isIconError)
                          const Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Please choose an icon',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () {
                  final isValid = formKey.currentState?.validate() ?? false;

                  if (selectedIcon == null) {
                    setState(() {
                      isIconError = true;
                    });
                    return;
                  }

                  if (!isValid) return;

                  Navigator.pop(
                    dialogContext,
                    CategoryModel(
                      name: nameController.text.trim(),
                      icon: selectedIcon!,
                      color: selectedColor,
                    ),
                  );
                },
                child: const Text('Save'),
              ),
            ],
          );
        },
      );
    },
  );
}
