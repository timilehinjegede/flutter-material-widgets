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
  int _selectedIndex = 0;
  GroupStatus groupStatus;
  LabelType labelType;
  bool leadingSwitchValue = false;
  bool trailingSwitchValue = false;

  int indexSelected = 0;
  int radioValue = 0;

  List<String> radioLabels = ['Selected', 'None', 'All'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            leading: leadingSwitchValue ? buildLeading() : SizedBox.shrink(),
            trailing: trailingSwitchValue ? buildTrailing() : SizedBox.shrink(),
            groupAlignment: getGroupValue(groupStatus),
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: getLabelType(labelType),
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
          VerticalDivider(thickness: 1, width: 1),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('Leading'),
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
          Row(
            children: <Widget>[
              Text('Trailing'),
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
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Text('Group Alignment'),
              ChoiceChip(
                label: Text('-1.0'),
                selected: indexSelected == 0,
                onSelected: (value) {
                  setState(
                    () {
                      groupStatus = GroupStatus.negativeOne;
                      indexSelected = value ? 0 : 0;
                    },
                  );
                },
              ),
              SizedBox(
                width: 10,
              ),
              ChoiceChip(
                label: Text('0.0'),
                selected: indexSelected == 1,
                onSelected: (value) {
                  setState(
                    () {
                      groupStatus = GroupStatus.zero;
                      indexSelected = value ? 1 : 0;
                    },
                  );
                },
              ),
              SizedBox(
                width: 10,
              ),
              ChoiceChip(
                label: Text('1.0'),
                selected: indexSelected == 2,
                onSelected: (value) {
                  setState(
                    () {
                      groupStatus = GroupStatus.positiveOne;
                      indexSelected = value ? 2 : 0;
                    },
                  );
                },
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Label Type'),
              for (int index = 0; index < 3; ++index)
                Row(
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
    );
  }

  void handleRadioValueChanged(int value) {
    setState(() {
      labelType = LabelType.values[value];
      radioValue = value;
    });
  }
}
