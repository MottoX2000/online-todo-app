import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logic.dart';
import 'package:provider_learn/helper/navigator.dart';
import 'package:provider_learn/model/data_model.dart';
import 'package:provider_learn/view_model/view_model.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ViewModel(),
        child: MaterialApp(
          navigatorKey: NavigatorService.instance.navigatorKey,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 26, 0, 71)),
            useMaterial3: true,
          ),
          home: const MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ViewModel>(context);
    List<NumModel> nums = provider.nums;
    Logic.viewModel = provider;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
            child: Text("Counter",
                style: Theme.of(context).textTheme.headlineMedium)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Values:',
            ),

            //Values
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: nums
                    .map((item) => Text(
                          '${item.value}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ))
                    .toList()),

            //Input Field
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber, width: 2.5)),
                child: TextFormField(
                  controller: provider.valueController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required Field";
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            //Buttons
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () => Logic.getBTN(), child: Text("Get")),
                  ElevatedButton(
                      onPressed: () => Logic.postBTN(), child: Text("Post")),
                  ElevatedButton(
                      onPressed: () => Logic.putBTN(), child: Text("Put")),
                  ElevatedButton(
                      onPressed: () => Logic.deleteBTN(),
                      child: Text("Delete")),
                ],
              ),
            ),

            //Info
            SizedBox(height: 25),
            Text(provider.infoTXT),
          ],
        ),
      ),
    );
  }
}
