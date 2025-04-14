import 'package:flutter/material.dart';
import '../model/data_model.dart';
import '../helper/api_manager.dart';
import '../helper/navigator.dart';

class ViewModel extends ChangeNotifier {
  final String url = "/numbers";

  List<NumModel> nums = [NumModel("Loading..")];
  String infoTXT = "";
  TextEditingController valueController = TextEditingController();

  final ApiManager _apiManager = ApiManager();
  bool putMode = false;

  ViewModel() {
    getNums();
  }

  getNums() async {
    NavigatorService.instance.showLoader();
    var resData = await _apiManager.get(url);

    if (resData != null) {
      nums = resData.map<NumModel>((item) => NumModel.fromJson(item)).toList();
      notifyListeners();
    } else {
      NavigatorService.instance.showWarning("resData is Null");
    }
    NavigatorService.instance.popWidget();
  }

  addNum() async {
    NavigatorService.instance.showLoader();
    var resData =
        await _apiManager.post(url, NumModel(valueController.text).toJson());
    if (resData != null) {
      getNums();
      valueController.clear();
    } else {
      throw Exception("resData is Null");
    }
    NavigatorService.instance.popWidget();
  }

  removeNum(String id) async {
    NavigatorService.instance.showLoader();
    var resData = await _apiManager.delete("$url/$id");

    if (resData != null) {
      getNums();
      valueController.clear();
    } else {
      throw Exception("resData is Null");
    }

    NavigatorService.instance.popWidget();
  }

  editNum(String id) async {
    if (!putMode) {
      infoTXT = "Now enter new value and press put again.";
      putMode = true;
      notifyListeners();
      return;
    }

    //Edit data
    NavigatorService.instance.showLoader();
    try {
      var resData = await _apiManager.put(
          "$url/$id", NumModel(valueController.text).toJson());
      if (resData != null) {
        getNums();
        valueController.clear();
      } else {
        NavigatorService.instance.showWarning("Failed to update the value");
      }
    } catch (e) {
      NavigatorService.instance.showWarning("Error updating value: $e");
    } finally {
      NavigatorService.instance.popWidget();
      //Set info text
      infoTXT = "";
      putMode = false;
      notifyListeners();
    }
  }

  //Helper func
}
