import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_menu_app/controller/add_dish_controller.dart';
import 'package:restaurant_menu_app/models/enums/meal_categories.dart';
import 'package:restaurant_menu_app/models/enums/meal_type.dart';
import 'package:restaurant_menu_app/utils/constants.dart';
import 'package:restaurant_menu_app/utils/helper_function.dart';
import 'package:restaurant_menu_app/utils/style.dart';
import 'package:restaurant_menu_app/views/widgets/custom_dropdown_button_form_field.dart';
import 'package:restaurant_menu_app/views/widgets/custom_elevated_button.dart';
import 'package:restaurant_menu_app/views/widgets/custom_switch_list_tile.dart';
import 'package:restaurant_menu_app/views/widgets/custom_text_input_field.dart';

class AddDishScreen extends ConsumerStatefulWidget {
  const AddDishScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AddDishScreen> createState() => _AddDishScreenState();
}

class _AddDishScreenState extends ConsumerState<AddDishScreen> {
  @override
  void initState() {
    super.initState();
    setInitialValue();
  }

  // Set Initial Value
  void setInitialValue() {
    final dish = ref.read(addDishProvider);
    _nameController.text = dish.name ?? '';
    _descriptionController.text = dish.description ?? '';
    _priceController.text = dish.price?.toStringAsFixed(2) ?? '';
    _waitingTimeController.text = dish.waitingTimeInMinutes?.toString() ?? '';
  }

  // Form Key
  final _formKey = GlobalKey<FormState>();

  // text Editing Controller
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _waitingTimeController = TextEditingController();

  // Validators

  String? validateTextField(String? value, String errorString) {
    if (value == null || value.isEmpty) {
      return errorString;
    }
    return null;
  }

  String? validateNumberField(String? value, String errorString) {
    if (value == null || value.isEmpty) {
      return errorString;
    }
    if (double.tryParse(value) == null) {
      return errorString;
    }
    return null;
  }

  String? validateDropDownField(value) {
    if (value == null) {
      return kDropDownValidationText;
    }
    return null;
  }

  // Submit Form and Add Dish to Menu
  void submitForm() {
    if (_formKey.currentState!.validate()) {
      // Validation succeeds, submit data
      ref.read(addDishProvider.notifier).addDishToMenu(
            name: _nameController.text,
            description: _descriptionController.text,
            price: double.parse(_priceController.text),
            waitingTime: int.parse(_waitingTimeController.text),
          );
      Navigator.pop(context);
      // Reset Form of Adding dish
      ref.invalidate(addDishProvider);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dish = ref.watch(addDishProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Reset Form of Adding dish
            ref.invalidate(addDishProvider);
            Navigator.pop(context);
          },
          icon: const Icon(
            kBackButton,
          ),
        ),
        title: const Text(
          kDishText,
          style: kAppBarTextStyle,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: kScreenPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextInputField(
                        textFieldController: _nameController,
                        height: screenHeight * 0.065,
                        width: screenWidth,
                        hintText: kNameText,
                        validator: (value) =>
                            validateTextField(value, kNameValidationText),
                        onSaved: (value) {},
                      ),
                      kHeightSizedBox,
                      CustomTextInputField(
                        textFieldController: _descriptionController,
                        height: screenHeight * 0.12,
                        width: screenWidth,
                        hintText: kDescriptionText,
                        maxLines: 3,
                        validator: (value) => validateTextField(
                          value,
                          kDescriptionValidationText,
                        ),
                        onSaved: (value) {},
                      ),
                      kHeightSizedBox,
                      SizedBox(
                        width: screenWidth,
                        height: screenHeight * 0.065,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextInputField(
                              textFieldController: _priceController,
                              height: screenHeight * 0.065,
                              width: screenWidth / 2.2,
                              hintText: kPriceText,
                              textInputType: TextInputType.number,
                              validator: (value) => validateNumberField(
                                value,
                                kPriceValidationText,
                              ),
                              onSaved: (value) {},
                            ),
                            CustomTextInputField(
                              textFieldController: _waitingTimeController,
                              height: screenHeight * 0.065,
                              width: screenWidth / 2.2,
                              hintText: kWaitingTimeText,
                              textInputType: TextInputType.number,
                              validator: (value) => validateNumberField(
                                value,
                                kPriceValidationText,
                              ),
                              onSaved: (value) {},
                            ),
                          ],
                        ),
                      ),
                      kHeightSizedBox,
                      CustomDropdownButtonFormField(
                        value: dish.mealCategory,
                        items: getListOfDropDownItemsFromEnum(
                            MealCategories.values),
                        hintText: kMealCategoryText,
                        onChanged: (newValue) => ref
                            .read(addDishProvider.notifier)
                            .onChangeMealCategory(newValue),
                        validator: (value) => validateDropDownField(value),
                      ),
                      kHeightSizedBox,
                      CustomDropdownButtonFormField(
                        value: dish.mealType,
                        items: getListOfDropDownItemsFromEnum(MealType.values),
                        hintText: kMealTypeText,
                        onChanged: (newValue) => ref
                            .read(addDishProvider.notifier)
                            .onChangeMealType(newValue),
                        validator: (value) => validateDropDownField(value),
                      ),
                      kHeightSizedBox,
                      CustomSwitchListTile(
                        text: kAvailableText,
                        onChanged: (value) => ref
                            .read(addDishProvider.notifier)
                            .onChangeAvailability(),
                        value: dish.isAvailable,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth,
                height: screenHeight * 0.05,
                child: CustomElevatedButton(
                  title: kSubmitText,
                  onPressed: submitForm,
                  isEnabled: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
