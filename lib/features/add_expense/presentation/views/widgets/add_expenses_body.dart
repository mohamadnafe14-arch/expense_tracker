import 'package:expense_tracker/core/functions/add_category_dialog.dart';
import 'package:expense_tracker/core/functions/convert_date_to_string.dart';
import 'package:expense_tracker/core/functions/show_scaffold.dart';
import 'package:expense_tracker/core/functions/show_success_snack_bar.dart';
import 'package:expense_tracker/features/add_expense/data/models/category_model.dart';
import 'package:expense_tracker/features/add_expense/presentation/views/widgets/show_category_chip_widget.dart';
import 'package:flutter/material.dart';

class AddExpensesBody extends StatefulWidget {
  const AddExpensesBody({super.key});

  @override
  State<AddExpensesBody> createState() => _AddExpensesBodyState();
}

class _AddExpensesBodyState extends State<AddExpensesBody> {
  late TextEditingController _amountController;
  late TextEditingController _dateController;
  late GlobalKey<FormState> _formKey;
  List<CategoryModel> categories = [];
  String? transactionType;

  @override
  initState() {
    super.initState();
    _amountController = TextEditingController();
    _dateController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  dispose() {
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(
          top: 50,
          left: 25,
          right: 25,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 25),
              const Text(
                'Add Expenses',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hint: Text(
                    'Enter Amount here',
                    style: TextStyle(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  final category = await addCategoryDialog(context);
                  if (category != null) {
                    setState(() {
                      categories.add(category);
                    });
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: categories.isEmpty
                      ? const Row(
                          children: [
                            Text(
                              'Click to add category',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Spacer(),
                            Icon(Icons.add),
                          ],
                        )
                      : Column(
                          children: [
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: categories.map((category) {
                                return Chip(
                                  label: ShowCategoryChipWidget(
                                    categoryModel: category,
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 10),
                            const Row(
                              children: [
                                Text(
                                  'Click to add category',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Spacer(),
                                Icon(Icons.add),
                              ],
                            ),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _dateController,
                readOnly: true,
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2022),
                    lastDate: DateTime.now(),
                  );
                  if (selectedDate != null) {
                    _dateController.text = convertDateToString(selectedDate);
                  }
                },
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  hint: Text(
                    'Click to select date',
                    style: TextStyle(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25),
              Column(
                children: [
                  RadioListTile<String>(
                    title: const Text("Deposit"),
                    value: "Deposit",
                    // ignore: deprecated_member_use
                    groupValue: transactionType,
                    // ignore: deprecated_member_use
                    onChanged: (value) {
                      setState(() {
                        transactionType = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text("Withdraw"),
                    value: "Withdraw",
                    // ignore: deprecated_member_use
                    groupValue: transactionType,
                    // ignore: deprecated_member_use
                    onChanged: (value) {
                      setState(() {
                        transactionType = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (categories.isEmpty) {
                        showScaffold(
                          context,
                          "Please select one category at least",
                        );
                      }
                      showScaffold(context, "Expense added successfully");
                      if (transactionType == null) {
                        showScaffold(context, "Please select transaction type");
                        return;
                      }
                      showSuccessToast(context, "Expense added successfully");
                    }
                  },
                  child: const Text('Add'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
