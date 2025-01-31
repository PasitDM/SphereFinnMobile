import 'package:flutter/material.dart';

import '../../../generator/assets.gen.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool centerTitle;
  final Widget? leading;
  final bool hideLeading;

  const PrimaryAppBar({
    super.key,
    this.title,
    this.actions,
    this.centerTitle = true,
    this.leading,
    this.hideLeading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        title: title != null ? Text(title!) : const SizedBox(),
        centerTitle: centerTitle,
        actions: actions,
        leading: hideLeading
            ? const SizedBox()
            : leading ??
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Assets.icons.common.backBtn.svg(),
                ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
