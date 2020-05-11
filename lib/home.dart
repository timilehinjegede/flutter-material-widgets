import 'package:flutter/material.dart';
import 'package:flutter_material_widgets/enums/group_status.dart';
import 'package:flutter_material_widgets/enums/label_type.dart';
import 'package:flutter_material_widgets/widgets/leading.dart';
import 'package:flutter_material_widgets/widgets/trailing.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // selected index for the navigation rail
  int _navigationRailSelectedIndex = 0;
  // an instance of the group alignment enum created
  GroupStatus groupStatus;
  // an instance of the label type enum created
  LabelType labelType;
  // initial value of the leading switch
  bool leadingSwitchValue = false;
  // initial value of the trailing switch
  bool trailingSwitchValue = false;
  // selected index of each choice chip
  int chipIndexSelected = 0;
  // value of each radio button
  int radioValue = 0;

  // list of strings that contains the radio labels (Text)
  List<String> radioLabels = ['None', 'Selected', 'All'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          // vertical padding so the navigation rail items stays out of the safe area
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25.0,
            ),
            child: NavigationRail(
              // leading property
              leading: leadingSwitchValue ? LeadingWidget() : SizedBox.shrink(),
              // trailing property
              trailing:
                  trailingSwitchValue ? TrailingWidget() : SizedBox.shrink(),
              // group alignment property
              groupAlignment: getGroupValue(groupStatus),
              // index of the selected navigation rail
              selectedIndex: _navigationRailSelectedIndex,
              // called when one of the destinations changes
              onDestinationSelected: (int index) {
                setState(() {
                  _navigationRailSelectedIndex = index;
                });
              },
              // set the current label of the navigation rail
              labelType: getLabelType(labelType),
              // Navigation rail destinations
              destinations: [
                NavigationRailDestination(
                  icon: Icon(
                    Icons.favorite_border,
                  ),
                  selectedIcon: Icon(
                    Icons.favorite,
                  ),
                  label: Text(
                    'First',
                  ),
                ),
                NavigationRailDestination(
                  icon: Icon(
                    Icons.bookmark_border,
                  ),
                  selectedIcon: Icon(
                    Icons.book,
                  ),
                  label: Text(
                    'Second',
                  ),
                ),
                NavigationRailDestination(
                  icon: Icon(
                    Icons.star_border,
                  ),
                  selectedIcon: Icon(
                    Icons.star,
                  ),
                  label: Text('Third'),
                ),
                NavigationRailDestination(
                  icon: Icon(
                    Icons.location_on,
                  ),
                  selectedIcon: Icon(
                    Icons.edit_location,
                  ),
                  label: Text('Forth'),
                ),
              ],
            ),
          ),
          // material design vertical divider to separate the navigation rail and other Widgets
          VerticalDivider(thickness: 1, width: 1),
          // contents of the main screen goes here
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Leading:'),
                Switch(
                  value: leadingSwitchValue,
                  onChanged: (value) {
                    setState(
                      () {
                        leadingSwitchValue = value;
                      },
                    );
                  },
                ),
              ],
            ),

            // ===== VERTICAL SPACING =====
            SizedBox(
              height: 5,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // trailing entry goes here
                Text('Trailing:'),
                Switch(
                  value: trailingSwitchValue,
                  onChanged: (value) {
                    setState(
                      () {
                        trailingSwitchValue = value;
                      },
                    );
                  },
                ),
              ],
            ),

            // ===== VERTICAL SPACING =====
            SizedBox(
              height: 5,
            ),

            // group alignment entry goes here
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                Text('Group Alignment:'),
                ChoiceChip(
                  label: Text('-1.0'),
                  selected: chipIndexSelected == 0,
                  onSelected: (value) {
                    setState(
                      () {
                        groupStatus = GroupStatus.negativeOne;
                        chipIndexSelected = value ? 0 : 0;
                      },
                    );
                  },
                ),

                // ===== HORIZONTAL SPACING =====
                SizedBox(
                  width: 10,
                ),

                ChoiceChip(
                  label: Text('0.0'),
                  selected: chipIndexSelected == 1,
                  onSelected: (value) {
                    setState(
                      () {
                        groupStatus = GroupStatus.zero;
                        chipIndexSelected = value ? 1 : 0;
                      },
                    );
                  },
                ),

                // ===== HORIZONTAL SPACING =====
                SizedBox(
                  width: 10,
                ),

                ChoiceChip(
                  label: Text('1.0'),
                  selected: chipIndexSelected == 2,
                  onSelected: (value) {
                    setState(
                      () {
                        groupStatus = GroupStatus.positiveOne;
                        chipIndexSelected = value ? 2 : 0;
                      },
                    );
                  },
                ),
              ],
            ),

            // ===== VERTICAL SPACING =====
            SizedBox(
              height: 5,
            ),

            // label type entry goes here
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Label Type:'),
                for (int index = 0; index < 3; ++index)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio<int>(
                        value: index,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                      ),
                      Text(radioLabels[index]),
                    ],
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // called anything a new radio button is selected
  void handleRadioValueChanged(int value) {
    setState(() {
      labelType = LabelType.values[value];
      radioValue = value;
    });
  }
}
