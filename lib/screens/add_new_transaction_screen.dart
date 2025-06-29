import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal/bloc/transaction/transaction_bloc.dart';
import 'package:goal/bloc/transaction/transaction_event.dart';
import 'package:goal/bloc/transaction/transaction_state.dart';
import 'package:goal/widgets/custom_text_field.dart';
import 'package:goal/widgets/dateField.dart';
import 'package:goal/widgets/dropDownField.dart';
import 'package:goal/widgets/file_picker.dart';

class AddNewTransactionScreen extends StatelessWidget {
  const AddNewTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransactionBloc(),
      child: const AddNewTransactionScreenBody(),
    );
  }
}

class AddNewTransactionScreenBody extends StatefulWidget {
  const AddNewTransactionScreenBody({super.key});

  @override
  State<AddNewTransactionScreenBody> createState() =>
      _AddNewTransactionScreenBodyState();
}

class _AddNewTransactionScreenBodyState
    extends State<AddNewTransactionScreenBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        bool isDebit = state.debitOrCredit == 'Debit';

        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              backgroundColor: const Color(0xFFF0F0F0),
              title: const Text(
                "Add Transaction",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Transaction type"),
                      Row(
                        children: [
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: isDebit
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                              side: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            onPressed: () {
                              if (!isDebit) {
                                context.read<TransactionBloc>().add(
                                  DebitOrCreditChanged('Debit'),
                                );
                              }
                            },
                            label: Text(
                              "Debit",
                              style: TextStyle(
                                color: isDebit ? Colors.white : Colors.black,
                              ),
                            ),
                            icon: Icon(
                              Icons.arrow_downward,
                              color: isDebit ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(width: 8),
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: !isDebit
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                              side: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            onPressed: () {
                              if (isDebit) {
                                context.read<TransactionBloc>().add(
                                  DebitOrCreditChanged('Credit'),
                                );
                              }
                            },
                            label: Text(
                              "Credit",
                              style: TextStyle(
                                color: !isDebit ? Colors.white : Colors.black,
                              ),
                            ),
                            icon: Icon(
                              Icons.arrow_upward,
                              color: !isDebit ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Dropdownfield(
                        items: ["Cash", "Online"],
                        hintText: 'Cash',
                        selectedValue: state.sourceSelection.isEmpty ? null : state.sourceSelection,
                        heading: "Source selection",
                        
                        onChanged: (value) {
                          context.read<TransactionBloc>().add(
                            SourceSelectionChanged(value),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        heading: "Amount",
                        hintText: "Enter Amount",
                        initialValue: state.amount,
                        onChanged: (value) {
                          context.read<TransactionBloc>().add(
                            AmountChanged(value),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      DateField(
                        heading: "Date",
                        hintText: "Select Date of Transaction",
                        onDateSelected: (value) {
                          context.read<TransactionBloc>().add(
                            DateChanged(value),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      Dropdownfield(
                        items: ["Food", "Others"],
                        hintText: "Eg. Food",
                        heading: "Category",
                        selectedValue:state.category.isEmpty ? null : state.category,
                        onChanged: (value) {
                          context.read<TransactionBloc>().add(
                            CategoryChanged(value),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Upload bill copy",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: " (optional)",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 7),
                      FilePickerWidget(
                        subtext: "Select the suitable document for upload here",
                        filepath: state.filepath,
                        onFilePicked: (path) {
                          context.read<TransactionBloc>().add(
                            FilepathChanged(path),
                          );
                        },
                      ),
                      const SizedBox(height: 35),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            // Undo Button
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  context.read<TransactionBloc>().add(
                                    UndoTransaction(),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xFFE6E6E6),
                                  foregroundColor: Colors.black87,
                                  side: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                    width: 0.5,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: const Text('Undo'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Save Button
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<TransactionBloc>().add(
                                    SubmitTransaction(),
                                  );
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(
                                    context,
                                  ).primaryColor,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  elevation: 0,
                                ),
                                child: const Text('Save'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
