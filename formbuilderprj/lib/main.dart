import 'package:flutter/material.dart';
import 'package:formbuiderprj/code_page.dart';
import 'sources/source.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter FormBuilder Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme()
              .copyWith(backgroundColor: Colors.blue.shade200)),
      home: const _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    return CodePage(
      title: 'Flutter Form Builder',
      child: ListView(
        children: [
          ListTile(
            title: const Text('Complete Form'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const CodePage(
                    title: 'Complete Form', child: CompleteForm());
              }));
            },
          ),
          const Divider(),
          ListTile(
              title: const Text('Custom Fields'),
              trailing: const Icon(Icons.arrow_right_sharp),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const CodePage(
                    title: 'Custom Fields',
                    child: CustomFields(),
                  );
                }));
              }),
          const Divider(),
          ListTile(
            title: const Text("Signup Form"),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const CodePage(
                  title: "SignUp Form",
                  child: SignUpForm(),
                );
              }));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Dynamic Form"),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const CodePage(
                    title: 'Dynamic Form', child: DynamicFields());
              }));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Conditional Form'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const CodePage(
                  title: 'Conditional Form',
                  child: ConditionalFields(),
                );
              }));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Related Fields'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const CodePage(
                  title: 'Related Form',
                  child: RelatedFields(),
                );
              }));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Radio checkbox itemDecorator'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const CodePage(
                  title: 'ItemDecorators',
                  child: DecoratedRadioCheckbox(),
                );
              }));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('GroupedRadio and GroupedCheckboc Orientation'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const CodePage(
                  title: 'GroupedRadio and GroupedCheckbox',
                  child: GroupedRadioCheckbox(),
                );
              }));
            },
          ),
        ],
      ),
    );
  }
}
