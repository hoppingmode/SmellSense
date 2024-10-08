import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:smellsense/app/application/providers/infrastructure.provider.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({
    super.key,
  });

  @override
  HomeScreenWidgetState createState() => HomeScreenWidgetState();
}

class HomeScreenWidgetState extends State<HomeScreenWidget> {
  final List<TrainingScent> scents = [];
  late final Infrastructure infrastructure;

  @override
  void initState() {
    super.initState();
    infrastructure = context.read<Infrastructure>();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return Scaffold(
        backgroundColor: theme.canvasColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              // TODO: Convert SVG image to another image format
              "assets/svg/smellsense_logo.svg",
              width: 50,
            ),
            Text(
              'SmellSense',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              'Smell Training',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            FloatingActionButton(
              onPressed: () => context.go('/training'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'screen.home.menu.train_menu_button'.tr(),
                style: textTheme.labelMedium,
              ),
            ),
            FloatingActionButton(
                onPressed: () => context.go('/training-progress'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'screen.home.menu.training_history_menu_button'.tr(),
                  style: textTheme.labelMedium,
                )),
            FloatingActionButton(
                onPressed: () => context.go('/about'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "screen.home.menu.about_menu_button".tr(),
                  style: textTheme.labelMedium,
                )),
            FloatingActionButton(
                onPressed: () => context.go('/help'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "screen.home.menu.help_menu_button".tr(),
                  style: textTheme.labelMedium,
                )),
          ],
        ));
  }
}
