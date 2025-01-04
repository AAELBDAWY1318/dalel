import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/profile/presentation/widget/custom_action_item.dart';
import 'package:dalel/features/profile/presentation/widget/custom_profile_overview.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.profile,
          style: AppTextStyles.pacifico40064.copyWith(fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CustomProfileOverview()),
            SliverToBoxAdapter(child: SizedBox(height: 30.0)),
            SliverToBoxAdapter(child: CustomActionItem()),
          ],
        ),
      ),
    );
  }
}
