import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:subzero_mobile/core/utils/extension.dart';

class AboutUsViewBody extends StatelessWidget {
  const AboutUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "AboutSubzero".tr(),
              style: context.texts.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text("AboutSubzeroDesc".tr(), style: context.texts.titleSmall!),
            SizedBox(height: 16),
            Text(
              "AboutTeam".tr(),
              style: context.texts.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text("AboutTeamDesc".tr(), style: context.texts.titleSmall!),
            SizedBox(height: 16),
            Text(
              "TeamMembers".tr(),
              style: context.texts.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            TeamMemberItem(
              title: "Salma".tr(),
              subtitle: "TeamLeader".tr(),
              image: "assets/team_members/Salma.jpeg",
            ),
            SizedBox(height: 16),
            Row(
              spacing: 16,
              children: [
                TeamMemberItem(
                  title: "Youssef".tr(),
                  subtitle: "Sowftware".tr(),
                  image: "assets/team_members/Youssef.jpg",
                ),
                TeamMemberItem(
                  title: "Yassin".tr(),
                  subtitle: "Sowftware".tr(),
                  image: "assets/team_members/Yassin.jpeg",
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              spacing: 16,
              children: [
                TeamMemberItem(
                  title: "Mostafa".tr(),
                  subtitle: "Hardware".tr(),
                  image: "assets/team_members/Kandil.jpeg",
                ),
                TeamMemberItem(
                  title: "Khaled".tr(),
                  subtitle: "Hardware".tr(),
                  image: "assets/team_members/Flex.jpeg",
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              spacing: 16,
              children: [
                TeamMemberItem(
                  title: "Ahmed".tr(),
                  subtitle: "Graphics".tr(),
                  image: "assets/team_members/Ahmed.jpeg",
                ),
                TeamMemberItem(
                  title: "Rahma".tr(),
                  subtitle: "Graphics".tr(),
                  image: "assets/team_members/Rahma.jpeg",
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              spacing: 16,
              children: [
                TeamMemberItem(
                  title: "Eyad".tr(),
                  subtitle: "Nontechnical".tr(),
                  image: "assets/team_members/Eyad.jpeg",
                ),
                TeamMemberItem(
                  title: "Sisi".tr(),
                  subtitle: "Nontechnical".tr(),
                  image: "assets/team_members/Sisi.jpeg",
                ),
              ],
            ),
            SizedBox(height: 16),
            TeamMemberItem(
              title: "Mohamed".tr(),
              subtitle: "Nontechnical".tr(),
              image: "assets/team_members/Mohmed.jpeg",
            ),
            SizedBox(height: 16),
            Row(
              spacing: 16,
              children: [
                TeamMemberItem(
                  title: "Mahmoud".tr(),
                  subtitle: "Supervisor".tr(),
                  image: "assets/team_members/Mahmoud.jpeg",
                ),
                TeamMemberItem(
                  title: "Sabry".tr(),
                  subtitle: "Supervisor".tr(),
                  image: "assets/team_members/Sabry.jpeg",
                ),
              ],
            ),
            Row(),
          ],
        ),
      ),
    );
  }
}

class TeamMemberItem extends StatelessWidget {
  final String title;

  final String subtitle;
  final String image;
  const TeamMemberItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final double size = 150;
    return Container(
      width: size,
      height: 250,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 2,
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 150,
            width: size,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.texts.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: context.texts.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
