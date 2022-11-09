import 'package:flutter/material.dart';


class ScrollableAppBar extends StatelessWidget {
  final String imageUrl;
  const ScrollableAppBar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
    
      toolbarHeight: 0,
      expandedHeight: 470,
      automaticallyImplyLeading: true,
      leading:  InkWell(
        onTap: (() {
          Navigator.pop(context);
        }),
        child: const Icon(
          Icons.arrow_back,
          size: 30,
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      centerTitle: true,
      flexibleSpace: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        child: Image(
          fit: BoxFit.fill,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
