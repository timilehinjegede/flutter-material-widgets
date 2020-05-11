import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum GroupStatus { negativeOne, zero, positiveOne }

double getGroupValue(GroupStatus groupStatus) {
  switch (groupStatus) {
    case GroupStatus.negativeOne:
      return -1.0;
      break;
    case GroupStatus.zero:
      return 0.0;
      break;
    case GroupStatus.positiveOne:
      return 1.0;
      break;
    default:
      return -1;
  }
}

enum LabelType { none, selected, all }

NavigationRailLabelType getLabelType(LabelType labelType) {
  switch (labelType) {
    case LabelType.none:
      return NavigationRailLabelType.none;
      break;
    case LabelType.selected:
      return NavigationRailLabelType.selected;
      break;
    case LabelType.all:
      return NavigationRailLabelType.all;
      break;
    default:
      return NavigationRailLabelType.selected;
  }
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
            leading: leadingSwitchValue ? _buildLeading() : SizedBox.shrink(),
            trailing:
                trailingSwitchValue ? _buildTrailing() : SizedBox.shrink(),
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
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('First'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text('Second'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Third'),
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

Widget _buildTrailing() {
  return Column(
    children: <Widget>[
      CircleAvatar(
        radius: 25,
        backgroundColor: Colors.blue,
      ),
      RotatedBox(
        quarterTurns: -1,
        child: Text('Trailing'),
      ),
    ],
  );
}

Widget _buildLeading() {
  return Column(
    children: <Widget>[
      CircleAvatar(
        radius: 25,
        backgroundColor: Colors.blue,
      ),
      RotatedBox(
        quarterTurns: -1,
        child: Text('Leading'),
      ),
    ],
  );
}
