import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomFields extends StatefulWidget {
  const CustomFields({super.key});

  @override
  State<CustomFields> createState() => _CustomFieldsState();
}

class _CustomFieldsState extends State<CustomFields> {
  final _formKey = GlobalKey<FormBuilderState>();

  static const List<String> _kOptions = <String>[
    'pikachu',
    'bulbasur',
    'charmander',
    'squirtle',
    'caterpie',
  ];

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            FormBuilderField<DateTime?>(
                name: 'date',
                builder: (FormFieldState field) {
                  return InputDatePickerFormField(
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 30)),
                    onDateSubmitted: (value) => field.didChange(value),
                    errorInvalidText: field.errorText,
                    onDateSaved: (value) => field.didChange(value),
                  );
                }),
            const SizedBox(
              height: 10,
            ),
            FormBuilderField<bool>(
              builder: (FormFieldState field) {
                return CheckboxListTile(
                    title: const Text('I Accept the terms and conditions'),
                    value: field.value ?? false,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (value) => field.didChange(value));
              },
              name: 'terms',
            ),
            const SizedBox(
              height: 10,
            ),
            FormBuilderField<String?>(
              name: 'terms',
              builder: (FormFieldState<String?> field) {
                return Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }
                    return _kOptions.where((String option) {
                      return option
                          .contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (String selection) {
                    field.didChange(selection);
                  },
                );
              },
              autovalidateMode: AutovalidateMode.always,
              validator: (valueCandidate) {
                if (valueCandidate?.isEmpty ?? true) {
                  return 'This Field is require';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    color: Theme.of(context).colorScheme.secondary,
                    child: const Text(
                      "submit",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        debugPrint(_formKey.currentState!.value.toString());
                      } else {
                        debugPrint("validation field");
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: MaterialButton(
                  onPressed: () {
                    _formKey.currentState!.reset();
                  },
                  child: const Text(
                    "Reset",
                    style: TextStyle(color: Colors.black),
                  ),
                )),
              ],
            )
          ],
        ));
  }
}
