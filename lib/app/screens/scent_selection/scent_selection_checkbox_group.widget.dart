import 'package:flutter/material.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent_display.module.dart';
import 'package:smellsense/app/shared/widgets/vertical_ellipses.widget.dart';

class ScentSelectionCheckboxGroupWidget extends StatefulWidget {
  static const maxSelectionCount = 4;

  final void Function(List<TrainingScentName>) onSelectionChange;

  const ScentSelectionCheckboxGroupWidget({
    super.key,
    required this.onSelectionChange,
  });

  @override
  ScentSelectionCheckboxGroupWidgetState createState() =>
      ScentSelectionCheckboxGroupWidgetState();
}

class ScentSelectionCheckboxGroupWidgetState
    extends State<ScentSelectionCheckboxGroupWidget> {
  final ScrollController _scrollController = ScrollController();

  late final Map<TrainingScentName, bool> selectedScents;
  bool _scrollEnded = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);

    selectedScents = TrainingScentName.values
        .fold<Map<TrainingScentName, bool>>(
            {}, (acc, element) => acc..[element] = false);
  }

  void _scrollListener() {
    if (_scrollController.position.atEdge) {
      setState(() {
        _scrollEnded = _scrollController.position.pixels != 0;
      });
    } else {
      setState(() {
        _scrollEnded = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return Stack(
      children: [
        ListView(
          itemExtent: 48,
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          clipBehavior: Clip.antiAlias,
          children: [
            for (TrainingScentDisplay scent in TrainingScentDisplay.getScents())
              CheckboxListTile(
                dense: true,
                checkboxShape: theme.checkboxTheme.shape,
                title: Text(
                  scent.displayName,
                  style: textTheme.bodyMedium!.copyWith(
                    color: scent.displayColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onChanged: (value) {
                  setState(
                    () {
                      var isChecked = value ?? false;
                      var scentSelections = selectedScents.keys
                          .where((key) => selectedScents[key] == true)
                          .toList();

                      if (!isChecked) {
                        setState(() {
                          selectedScents[scent.name] = isChecked;
                          scentSelections.remove(scent.name);
                          widget.onSelectionChange(scentSelections);
                        });

                        return;
                      }

                      ///
                      /// Prevent the checkbox from being selected, and show a snackbar
                      /// to the user
                      ///
                      if (scentSelections.length ==
                          ScentSelectionCheckboxGroupWidget.maxSelectionCount) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 2),
                            content: Text(
                              'You have already selected ${ScentSelectionCheckboxGroupWidget.maxSelectionCount} scents.',
                              textAlign: TextAlign.center,
                              style: textTheme.labelSmall!.copyWith(
                                color: theme.colorScheme.onError,
                              ),
                            ),
                          ),
                        );
                        return;
                      }

                      setState(() {
                        selectedScents[scent.name] = isChecked;
                        widget.onSelectionChange(
                            [...scentSelections, scent.name]);
                      });
                    },
                  );
                },
                value: selectedScents[scent.name],
                controlAffinity: ListTileControlAffinity.leading,
              ),
          ],
        ),
        if (!_scrollEnded)
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: VerticalEllipses(),
            ),
          ),
      ],
    );
  }
}
