import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomUpdateInfoForm extends StatelessWidget {
  final dynamic userData;
  const CustomUpdateInfoForm({super.key, this.userData});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    emailController.text = userData["email"];
    firstNameController.text = userData["firstName"];
    lastNameController.text = userData["secondName"];
    return Column(
      children: [
        CustomTextField(
          label: "email",
          controller: emailController,
        ),
        CustomTextField(
          label: "First Name",
          controller: firstNameController,
        ),
        CustomTextField(
          label: "Last Name",
          controller: lastNameController,
        ),
        const SizedBox(height: 30.0),
        CustomButton(text: "Update Info", onPressed: (){}),
      ],
    );
  }
}
