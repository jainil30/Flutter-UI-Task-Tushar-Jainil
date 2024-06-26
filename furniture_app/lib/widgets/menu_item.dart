import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/*
  Created By : Jainil Dalwadi
  Purpose : Single Menu Item for menus in the app
 */
class CustomMenuItem extends StatelessWidget {
  const CustomMenuItem(
      {super.key,
      this.title,
      this.iconPath,
      this.subTitle,
      required this.isSvg,
      this.routeTo});

  final String? iconPath;
  final String? title;
  final String? subTitle;
  final bool? isSvg;
  final String? routeTo;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).hoverColor,
      child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ListTile(
              leading: Container(
                  child: (isSvg!)
                      ? SvgPicture.asset(iconPath!)
                      : Image.asset(iconPath!)),
              title: Text(
                title ?? "",
                style: Theme.of(context).textTheme.displaySmall!,
              ),
            ),
          ),
          onTap: () {
            if (routeTo!.isNotEmpty || routeTo != "") {
              Navigator.pushNamed(context, routeTo!);
            }
          }),
    );
  }
}
