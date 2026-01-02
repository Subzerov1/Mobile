import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:subzero_mobile/core/utils/extension.dart';
import 'package:subzero_mobile/features/home/presentation/views/widgets/home%20view/devices_list_view.dart';
import 'package:subzero_mobile/features/home/presentation/views/widgets/home%20view/personal_card_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Expanded(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(child: PersonalCardWidget()),
              ];
            },
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Text("Devices".tr(), style: context.texts.titleLarge),
                ),
                Expanded(child: DevicesListView()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
