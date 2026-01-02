import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subzero_mobile/core/services/hive_service.dart';
import 'package:subzero_mobile/core/utils/extension.dart';
import 'package:subzero_mobile/features/home/presentation/manager/main%20cubit/main_cubit.dart';

class PersonalCardWidget extends StatelessWidget {
  const PersonalCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      width: double.maxFinite,
      clipBehavior: Clip.hardEdge,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            color: Colors.grey.withAlpha(128),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Column(
              spacing: 2,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  HiveService.instance.user!.name.lang(context.lang),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Text(
                  HiveService.instance.user!.jobTitle.lang(context.lang),
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<MainCubit, MainState>(
            buildWhen: (previous, current) => current is MainUpdate,
            builder: (context, state) {
              return CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: HiveService.instance.user!.imagePath ?? "",
                errorWidget: (context, url, error) {
                  return Container(
                    alignment: Alignment.center,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(color: context.colors.primary.withAlpha(100)),
                    child: Image.asset(
                      "assets/user.png",
                      color: Colors.blueGrey,
                      height: 50,
                      width: 80,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
