import 'package:flutter/material.dart';

class NavigatorService {
  late GlobalKey<NavigatorState> navigatorKey;

  static NavigatorService instance = NavigatorService();

  //Singleton Design Patterni ile de yapılabilir
  NavigatorService() {
    navigatorKey = GlobalKey<NavigatorState>();
  }

  void pushWidget(Widget widget) {
    Navigator.push(navigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => widget));
  }

  void popWidget() {
    Navigator.pop(navigatorKey.currentContext!);
  }

  void showLoader() {
    Future.delayed(
        Duration.zero,
        () => showDialog(
            barrierDismissible: false,
            context: navigatorKey.currentContext!,
            builder: (BuildContext context) => const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )));
  }

  void showWarning(String text) {
    showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) => AlertDialog(
              icon: Icon(Icons.error),
              content: Text(text),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      NavigatorService.instance.popWidget();
                    },
                    child: Text("Ok")),
              ],
            ));
  }
}
