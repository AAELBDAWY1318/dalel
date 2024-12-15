import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/profile/presentation/widget/custom_editable_image.dart';
import 'package:dalel/features/profile/presentation/widget/custom_form.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  final dynamic userData;
  const EditProfileView({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: AppTextStyles.pacifico40064.copyWith(fontSize: 20.0),
        ),
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
                child: CustomEditableImage(image: userData["image"])),
            SliverToBoxAdapter(child: CustomUpdateInfoForm(userData: userData)),
          ],
        ),
      ),
    );
  }
}
