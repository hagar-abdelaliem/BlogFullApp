import 'package:flutter/material.dart';
import 'package:untitled2/shared/style/my_theme.dart';

abstract class BaseNavigator {
  void showLoading();

  void hideLoading();

  void showMessage(String message, bool success);

  Future<void> showDialogWithGif(
      {required img,
      String? title,
      String? content,
      Color? titleColor,
      Color? contentColor});
}

class BaseViewModel<Nav extends BaseNavigator> extends ChangeNotifier {
  Nav? navigator;
}

abstract class BaseState<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator {
  late VM viewModel;

  // abstract setter for viewModel
  VM initViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
    viewModel.navigator = this;
  }

  @override
  void hideLoading() {
    Navigator.pop(context);
  }

  @override
  void showLoading() {
    showDialog(
        context: context,
        builder: (c) {
          return AlertDialog(
            title: Center(
                child: CircularProgressIndicator(
              color: MyThemeData.primaryColor,
            )),
          );
        });
  }

  @override
  void showMessage(String message, bool success) {
    showDialog(
        context: context,
        builder: (c) {
          return AlertDialog(
            content: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                message,
                style: TextStyle(
                    color: success
                        ? MyThemeData.primaryColor
                        : Colors.red.shade400,
                    fontSize: 17),
              ),
            ),
            actions: [
              Center(
                  child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.cancel,
                  color: MyThemeData.primaryColor,
                ),
              ))
            ],
          );
        });
  }

  @override
  Future<void> showDialogWithGif(
          {String? title,
          String? content,
          required img,
          Color? titleColor,
          Color? contentColor}) =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: title == null
              ? Image.asset(img)
              : Column(
                  children: [
                    Image.asset(img),
                    Text(
                      title!,
                      style: TextStyle(color: titleColor!, fontSize: 17),
                    ),
                  ],
                ),
          content: content == null
              ? null
              : Text(
                  content,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: contentColor!,
                  ),
                ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 2.0, right: 8.0, bottom: 8.0, top: 8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );
}
