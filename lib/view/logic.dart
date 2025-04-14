import "../model/data_model.dart";
import "../view_model/view_model.dart";
import '../helper/navigator.dart';

class Logic {
  static late ViewModel viewModel;
  static String targetNumId = "";

  //Buttons
  static void getBTN() {
    viewModel.getNums();
  }

  static void postBTN() {
    viewModel.addNum();
  }

  static void putBTN() {
    if (!viewModel.putMode) {
      NumModel? num = searchNum(viewModel.valueController.text);
      if (num != null) {
        viewModel.editNum(viewModel.valueController.text);
        targetNumId = num.sId!;
      } else {
        NavigatorService.instance.showWarning("Please enter the vaild value.");
      }
    } else {
      viewModel.editNum(targetNumId);
      targetNumId = "";
    }
  }

  static void deleteBTN() {
    NumModel? num = searchNum(viewModel.valueController.text);
    if (num != null) {
      viewModel.removeNum(num.sId!);
    } else {
      NavigatorService.instance.showWarning("Please enter the vaild value.");
    }
  }

  //helper func
  static NumModel? searchNum(String value) {
    if (viewModel.nums.any((item) => item.value == value) == true) {
      NumModel num = viewModel.nums.firstWhere(
        (item) => item.value == viewModel.valueController.text,
      );
      return num;
    } else {
      return null;
    }
  }
}
