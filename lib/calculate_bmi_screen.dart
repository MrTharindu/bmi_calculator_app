import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bmi_calculator/result_screen.dart';
import 'package:bmi_calculator/bmi_calculator_controller.dart';

class CalculateBMIScreen extends StatelessWidget {
  const CalculateBMIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BMICalculatorController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.heightController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration:
                  const InputDecoration(labelText: 'Enter your Height (in cm)'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: controller.weightController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration:
                  const InputDecoration(labelText: 'Enter your Weight (in kg)'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                controller.calculateBMI();
                if (controller.bmi.value != 0.0) {
                  Get.to(() => const ResultScreen());
                }
              },
              child: const Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
