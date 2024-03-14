import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/dashboard_application_screens/categoriesManegar/categoriesWidgets/customeShowDialog.dart';
import 'package:untitled2/dashboard_application_screens/categoriesManegar/viewAllCategories/Categories_navigator.dart';
import 'package:untitled2/dashboard_application_screens/categoriesManegar/viewAllCategories/categoriesViewModel.dart';
import 'package:untitled2/models/CategoryModel.dart';
import 'package:untitled2/shared/base.dart';
import 'package:untitled2/shared/network/remote/api_manager.dart';
import 'package:untitled2/shared/style/my_theme.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState
    extends BaseState<CategoriesView, CategoriesViewModel>
    implements CategoriesNavigator {
  List<Category>? categories;
  List<Category>? filteredUsers = [];
  String searchQuery = "";

  late TextEditingController deleteCategoryController;

  late TextEditingController idController;
  late TextEditingController nameController;
  late TextEditingController imageController;
  late TextEditingController colorCodeController;

  late TextEditingController updateIdController;
  late TextEditingController updateNameController;
  late TextEditingController updateImageController;
  late TextEditingController updateColorCodeController;

  final GlobalKey<FormState> updateCategoryFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> addCategoryFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> deleteCategoryFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    deleteCategoryController = TextEditingController();
    idController = TextEditingController();
    nameController = TextEditingController();
    imageController = TextEditingController();
    colorCodeController = TextEditingController();

    updateIdController = TextEditingController();
    updateNameController = TextEditingController();
    updateImageController = TextEditingController();
    updateColorCodeController = TextEditingController();

    super.initState();
  }

  Widget _buildSearchBar() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.12,
          right: MediaQuery.of(context).size.width * 0.13,
          bottom: MediaQuery.of(context).size.height * .02,
        ),
        child: TextField(
          onChanged: (query) {},
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search by name or ID',
            prefixIcon: const Icon(Icons.search),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 3,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 3,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                margin: const EdgeInsets.only(top: 15, right: 15),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    _buildSearchBar(),
                    TextButton(
                      onPressed: openAddNewCategoryDialog,
                      child: const Text(
                        'add new category +',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: FutureBuilder<CategoryResponse>(
                          future: ApiManager.getCategories(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(
                                  snapshot.error.toString(),
                                  style: const TextStyle(color: Colors.red),
                                ),
                              );
                            }
                            if (snapshot.hasData) {
                              categories = snapshot.data!.categories;
                              List<Category>? categoriesToDisplay =
                                  searchQuery.isEmpty
                                      ? categories!
                                      : filteredUsers;
                              return Column(
                                children: [
                                  DataTable(
                                    headingRowColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => Colors.grey),
                                    columns: [
                                      DataColumn(
                                          label: SizedBox(
                                        //width: MediaQuery.of(context).size.width *0.15,
                                        child: Text(
                                          'Category ID',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(color: Colors.black),
                                        ),
                                      )),
                                      DataColumn(
                                          label: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.13,
                                        child: Text(
                                          'Category Name',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(color: Colors.black),
                                        ),
                                      )),
                                      DataColumn(
                                          label: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.13,
                                        child: Text(
                                          'Category Image',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(color: Colors.black),
                                        ),
                                      )),
                                      DataColumn(
                                          label: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.13,
                                        child: Text(
                                          'Color Code',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(color: Colors.black),
                                        ),
                                      )),
                                      const DataColumn(label: Text('')),
                                    ],
                                    rows: categoriesToDisplay!
                                        .map(
                                          (category) => DataRow(
                                            cells: [
                                              DataCell(Text(
                                                  category.id.toString(),
                                                  style: const TextStyle(
                                                      color: Colors.black))),
                                              DataCell(Text(category.name!,
                                                  style: const TextStyle(
                                                      color: Colors.black))),
                                              DataCell(Text(category.image!,
                                                  style: const TextStyle(
                                                      color: Colors.black))),
                                              DataCell(Text(category.colorCode!,
                                                  style: const TextStyle(
                                                      color: Colors.black))),
                                              DataCell(
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        viewCategory(category);
                                                      },
                                                      icon: const Icon(Icons
                                                          .visibility_outlined),
                                                      color: Colors.black,
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        updateIdController
                                                                .text =
                                                            category.id
                                                                .toString();
                                                        updateNameController
                                                                .text =
                                                            category.name!;
                                                        updateImageController
                                                                .text =
                                                            category.image!;
                                                        updateColorCodeController
                                                                .text =
                                                            category.colorCode!;
                                                        openUpdateCategoryDialog(
                                                            category);
                                                      },
                                                      icon: const Icon(
                                                          Icons.edit),
                                                      color: Colors.green,
                                                    ),
                                                    IconButton(
                                                      onPressed: () async {
                                                        openDeleteCategoryDialog(
                                                            category);
                                                      },
                                                      icon: const Icon(
                                                          Icons.delete),
                                                      color: Colors.red,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ],
                              );
                            }
                            return const Center(
                                child: Center(
                              child: CircularProgressIndicator(
                                color: Color(0xff39A552),
                              ),
                            ));
                          }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  CategoriesViewModel initViewModel() {
    return CategoriesViewModel();
  }

  @override
  Future openAddNewCategoryDialog() => showDialog(
        context: context,
        builder: (context) => CustomShowDialog(
          title: 'Add New Category',
          formKey: addCategoryFormKey,
          actionText: 'Add',
          viewModel: viewModel,
          nameController: nameController,
          imageController: imageController,
          colorCodeController: colorCodeController,
        ),
      );

  @override
  Future openDeleteCategoryDialog(Category category) => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              'Are you sure want to delete?',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontSize: 16, color: Colors.red),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  title: const Text('Category ID'),
                  leading: const Icon(Icons.security),
                  subtitle: Text(category.id.toString()),
                ),
                ListTile(
                  title: const Text('Category Name'),
                  leading: const Icon(Icons.category_outlined),
                  subtitle: Text(category.name!),
                ),
              ],
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
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
                child: TextButton(
                  onPressed: () {
                    viewModel.deleteCategoryById(category.id);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                ),
              )
            ],
          ));

  @override
  Future openUpdateCategoryDialog(Category category) => showDialog(
        context: context,
        builder: (context) => CustomShowDialog(
          title: 'Update Category',
          formKey: updateCategoryFormKey,
          actionText: 'Update',
          viewModel: viewModel,
          nameController: updateNameController,
          imageController: updateImageController,
          colorCodeController: updateColorCodeController,
        ),
      );

  TextStyle textStyle = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black);
  TextStyle subtitleStyle =
      const TextStyle(color: Color(0xCB252A25), fontSize: 15);

  Future viewCategory(Category category) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          scrollable: true,
          title: Center(
            child: Text(
              category.name!.toUpperCase(),
              style: textStyle.copyWith(
                  color: MyThemeData.primaryColor, fontSize: 20),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Category ID:', style: textStyle),
                leading: const Icon(Icons.security, color: Colors.green),
                subtitle: Text(category.id.toString(),
                    style: MyThemeData.lightTheme.textTheme.headlineSmall),
              ),
              ListTile(
                title: Text('Category Name:', style: textStyle),
                leading: Icon(Icons.category_outlined,
                    color: MyThemeData.primaryColor),
                subtitle: Text(category.name!, style: subtitleStyle),
              ),
              ListTile(
                title: Text('Category Image:', style: textStyle),
                leading: Icon(Icons.image, color: MyThemeData.primaryColor),
                subtitle: Text(category.image!, style: subtitleStyle),
              ),
              ListTile(
                title: Text('Category Color Code:', style: textStyle),
                leading: Icon(Icons.color_lens_outlined,
                    color: MyThemeData.primaryColor),
                subtitle: Text(category.colorCode!, style: subtitleStyle),
              ),
              ListTile(
                title: Text('Category Created Date:', style: textStyle),
                leading:
                    Icon(Icons.date_range, color: MyThemeData.primaryColor),
                subtitle: Text(formattedDate(category.createdAt!)!,
                    style: subtitleStyle),
              ),
              ListTile(
                title: Text('Category Updated Date:', style: textStyle),
                leading:
                    Icon(Icons.date_range, color: MyThemeData.primaryColor),
                subtitle: Text(formattedDate(category.updatedAt!)!,
                    style: subtitleStyle),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 2.0, right: 8.0, bottom: 8.0, top: 8.0),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  String? formattedDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return '${dateTime.year}-${dateTime.month}-${dateTime.day} at ${dateTime.hour}:${dateTime.minute}';
  }
}
