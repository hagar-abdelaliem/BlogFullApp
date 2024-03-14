import 'package:flutter/material.dart';
import 'package:untitled2/dashboard_application_screens/categoriesManegar/viewAllCategories/categoriesViewModel.dart';
import 'package:untitled2/models/CategoryModel.dart';
import 'package:untitled2/shared/componentes/customWidets/simple_text_field.dart';

class CustomShowDialog extends StatefulWidget {
  String title;
  GlobalKey<FormState> formKey;
  String actionText;
  final Function()? actionFunction;
  CategoriesViewModel? viewModel;

  TextEditingController nameController;
  TextEditingController imageController;
  TextEditingController colorCodeController;

  CustomShowDialog({
    super.key,
    required this.title,
    required this.formKey,
    required this.actionText,
    this.actionFunction,
    required this.viewModel,
    required this.nameController,
    required this.imageController,
    required this.colorCodeController,
  });

  @override
  State<CustomShowDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomShowDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: widget.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              SimpleTextField(
                text: 'Category Name',
                controller: widget.nameController,
                validatorFunction: (text) =>
                    widget.viewModel?.categoryNameValidation(text),
              ),
              const SizedBox(
                height: 10,
              ),
              SimpleTextField(
                text: 'Category image',
                controller: widget.imageController,
                validatorFunction: (text) =>
                    widget.viewModel?.categoryNameValidation(text),
              ),
              const SizedBox(
                height: 10,
              ),
              SimpleTextField(
                text: 'Category color code',
                controller: widget.colorCodeController,
                validatorFunction: (text) =>
                    widget.viewModel?.categoryNameValidation(text),
              ),
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
              left: 2.0, right: 8.0, bottom: 8.0, top: 8.0),
          child: TextButton(
            onPressed: () {
              clearControllers();
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.green, fontSize: 15),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
          child: TextButton(
            onPressed: widget.actionText == 'Add'
                ? addNewCategory
                : (widget.actionText == 'Update'
                    ? updateCategory
                    : widget.actionFunction),
            child: Text(
              widget.actionText,
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
          ),
        )
      ],
    );
  }

  void addNewCategory() {
    if (widget.formKey.currentState!.validate()) {
      Category category = Category(
        name: widget.nameController.text,
        image: widget.imageController.text,
        colorCode: widget.colorCodeController.text,
      );
      widget.viewModel!.addNewCategory(category);
      clearControllers();
    }
  }

  void updateCategory() {
    if (widget.formKey.currentState!.validate()) {
      Category category = Category(
        name: widget.nameController.text,
        image: widget.imageController.text,
        colorCode: widget.colorCodeController.text,
      );
      widget.viewModel!.updateCategoryInfo(category);
      clearControllers();
    }
  }

  clearControllers() {
    widget.nameController.clear();
    widget.imageController.clear();
    widget.colorCodeController.clear();
  }
}
