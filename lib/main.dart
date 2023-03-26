import 'package:flutter/material.dart';
import '../src/utils/themes/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: VAAppTheme.lightTheme,
      darkTheme: VAAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Color Swatches"),
          leading: const Icon(Icons.ondemand_video),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(
                "Heading",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                "Sub-heading",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                "Paragraph",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Elevated Button"),
              ),
              OutlinedButton(
                  onPressed: () {}, child: const Text("Outlined Button")),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Image(image: AssetImage("assets/images/starbucks.jpeg")),
              )
            ],
          ),
        ));
  }
}
