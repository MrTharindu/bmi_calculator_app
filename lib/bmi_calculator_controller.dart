import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BMICalculatorController extends GetxController {
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final bmi = 0.0.obs;
  final category = ''.obs;

  void calculateBMI() {
    if (heightController.text.isEmpty && weightController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your height & weight !',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    } else if (heightController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your height !',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    } else if (weightController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your weight !',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Convert height to meters
    double height = double.parse(heightController.text) / 100;
    double weight = double.parse(weightController.text);

    // Round BMI to two decimal places
    bmi.value = double.parse((weight / (height * height)).toStringAsFixed(2));

    if (bmi.value < 16) {
      category.value = 'Severe undernourishment';
    } else if (bmi.value < 16.9) {
      category.value = 'Medium undernourishment';
    } else if (bmi.value < 18.4) {
      category.value = 'Slight undernourishment';
    } else if (bmi.value < 24.9) {
      category.value = 'Normal nutrition state';
    } else if (bmi.value < 29.9) {
      category.value = 'Overweight';
    } else if (bmi.value < 39.9) {
      category.value = 'Obesity';
    } else {
      category.value = 'Pathological obesity';
    }
  }
}
