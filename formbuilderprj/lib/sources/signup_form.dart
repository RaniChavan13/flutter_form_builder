import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formkey = GlobalKey<FormBuilderState>();
  // final _emailFieldKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: FormBuilder(
            key: _formkey,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'full_name',
                  decoration: const InputDecoration(labelText: 'Full Name'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormBuilderTextField(
                  name: 'password',
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormBuilderTextField(
                  name: 'confirm_password',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    // suffixIcon: (_formkey.currentState
                    //             ?.fields['confirm_password']?.hasError ??
                    //         false)
                    //     ? const Icon(Icons.error, color: Colors.red)
                    //     : const Icon(Icons.check, color: Colors.green)
                  ),
                  obscureText: true,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      (value) =>
                          _formkey.currentState?.fields['password']?.value !=
                                  value
                              ? 'No Match'
                              : null,
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormBuilderFieldDecoration<bool>(
                  name: 'test',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.equal(true),
                  ]),
                  decoration: const InputDecoration(labelText: 'Accept Terms?'),
                  builder: (FormFieldState<bool> field) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        errorText: field.errorText,
                      ),
                      child: SwitchListTile(
                          title: const Text(
                              'I have read and accept the terms of service .'),
                          onChanged: field.didChange,
                          value: field.value ?? false),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    if (_formkey.currentState?.saveAndValidate() ?? false) {
                      if (true) {
                        _formkey.currentState?.fields['email']
                            ?.invalidate('Email already taken.');

                        //Or invalidate using field key
                        // _emailFieldKey.currentState
                        //     ?.inValidate('email already taken');
                      }
                    }
                    debugPrint(_formkey.currentState?.value.toString());
                  },
                  child: const Text('signUp',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            )),
      ),
    );
  }
}
