// lib/screens/add_new_goal.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal/bloc/goal/form_bloc.dart';
import 'package:goal/bloc/goal/form_event.dart';
import 'package:goal/bloc/goal/form_state.dart';
import 'package:goal/widgets/custom_text_field.dart';
import 'package:goal/widgets/dateField.dart';
import 'package:goal/widgets/dropDownField.dart';

class AddNewGoal extends StatelessWidget {
  const AddNewGoal({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocProvider<FormBloc>(
        create: (_) => FormBloc(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(
              "Add New Goal",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            backgroundColor: const Color(0xFFF0F0F0),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: BlocBuilder<FormBloc, GoalState>(
                  builder: (context, state) {
                    final bloc = context.read<FormBloc>();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          heading: "Goal Name",
                          hintText: "Enter your Goal Name",
                          initialValue: state.goalName,
                          onChanged: (v) => bloc.add(GoalNameChanged(v)),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          heading: "Target Amount",
                          hintText: "How much do you want to save",
                          initialValue: state.amount,
                          onChanged: (v) => bloc.add(TargetAmountChanged(v)),
                        ),
                        const SizedBox(height: 8),
                        DateField(
                          heading: "Target Date",
                          hintText: "Select Target Date",
                          selectedDate: state.date,
                          onDateSelected: (v) => bloc.add(TargetDateChanged(v)),
                        ),
                        const SizedBox(height: 8),
                        Dropdownfield(
                          heading: "Priority Level",
                          items: ['low', 'medium', 'high'],
                          hintText: state.priority.isEmpty
                              ? 'medium'
                              : state.priority,
                          onChanged: (v) => bloc.add(PrioityLevelChanged(v)),
                        ),
                        const SizedBox(height: 8),
                        Dropdownfield(
                          heading: "Set Source Account",
                          items: ['Account A', 'Account B', 'Account C'],
                          hintText: state.sourceAccount.isEmpty
                              ? 'Select Source Account'
                              : state.sourceAccount,
                          onChanged: (v) => bloc.add(SourceAccountChanged(v)),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: state.isValid
                              ? () {
                                  bloc.add(SubmitGoal());
                                  Navigator.of(context).pop();
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(double.infinity, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                              side: const BorderSide(
                                width: 0.5,
                                color: Color.fromRGBO(0,0,0,0.45),
                              ),
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                          child: const Text(
                            "Set Goal",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
