// ignore_for_file: depend_on_referenced_packages

import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sample_app/features/task/domain/entities/task.dart';
import 'package:sample_app/features/task/presentation/bloc/task_bloc.dart';

class TaskCreateScreen extends StatelessWidget {
  const TaskCreateScreen({
    super.key,
    required this.isToday,
  });

  final bool isToday;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    final taskBloc = BlocProvider.of<TaskBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Add New Task'),
      ),
      body: FormBuilder(
          key: formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'name',
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              FormBuilderDateTimePicker(
                name: 'time',
                initialEntryMode: DatePickerEntryMode.calendar,
                inputType: InputType.time,
                decoration: const InputDecoration(
                  labelText: 'Time',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              FormBuilderTextField(
                name: 'notes',
                decoration: const InputDecoration(
                  labelText: 'Notes',
                ),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // Save form state
                    formKey.currentState!.save();
                    final values = formKey.currentState!.value;

                    // A bit ugly but can do for now
                    final time = DateFormat("h:mm a").format(values['time']);

                    final task = Task(
                      name: values['name'],
                      time: time,
                      notes: values['notes'],
                    );

                    taskBloc.add(TaskAdd(
                      task: task,
                      isToday: isToday,
                    ));

                    // need to go back
                    context.go('/');
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          )),
    );
  }
}
