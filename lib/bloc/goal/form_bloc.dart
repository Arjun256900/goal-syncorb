import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goal/bloc/goal/form_event.dart';
import 'package:goal/bloc/goal/form_state.dart';

class FormBloc extends Bloc<GoalEvent, GoalState> {
  FormBloc() : super(GoalState.initial()) {
    on<GoalNameChanged>((event, emit) {
      final newState = state.copyWith(goalName: event.goalName);
      emit(newState.copyWith(isValid: _formIsValid(newState)));
    });

    // …and similarly for the others…
    on<TargetAmountChanged>((event, emit) {
      final newState = state.copyWith(amount: event.amount);
      emit(newState.copyWith(isValid: _formIsValid(newState)));
    });

    on<TargetDateChanged>((event, emit) {
      final newState = state.copyWith(date: event.date);
      emit(newState.copyWith(isValid: _formIsValid(newState)));
    });

    on<PrioityLevelChanged>((event, emit) {
      final newState = state.copyWith(priority: event.prioity);
      emit(newState.copyWith(isValid: _formIsValid(newState)));
    });

    on<SourceAccountChanged>((event, emit) {
      final newState = state.copyWith(sourceAccount: event.sourceAccount);
      emit(newState.copyWith(isValid: _formIsValid(newState)));
    });
    on<SubmitGoal>((event, emit) {
      print(
        "🎯 Goal Submitted! "
        "Name: ${state.goalName}, "
        "Amount: ${state.amount}, "
        "Date: ${state.date}, "
        "Priority: ${state.priority}, "
        "From: ${state.sourceAccount}",
      );
    });
  }
  bool _formIsValid(GoalState s) {
    return s.goalName.isNotEmpty &&
        s.amount.isNotEmpty &&
        s.date.isNotEmpty &&
        s.priority.isNotEmpty &&
        s.sourceAccount.isNotEmpty;
  }
}
