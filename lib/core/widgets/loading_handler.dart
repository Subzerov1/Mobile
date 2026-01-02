import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingHandler extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final bool isEmpty;
  const LoadingHandler({
    super.key,
    required this.child,
    required this.isLoading,
    required this.isEmpty,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) return LoadingTypeWidget(child: child);
    return child;
  }
}

class LoadingTypeWidget extends StatelessWidget {
  final Widget child;
  const LoadingTypeWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (child is ListView) return LoadingList();
    if (child is Column) return LoadingList();
    return const Placeholder();
  }
}

class LoadingList extends StatelessWidget {
  const LoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => LoadingItem(),
    );
  }
}

class LoadingItem extends StatelessWidget {
  const LoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
