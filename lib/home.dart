import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool leadingSwitchValue = false;
  bool trailingSwitchValue = false;

  int indexSelected = -1;
  int radioValue = 0;

  List<String> radioLabels = ['Selected', 'None', 'All'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            groupAlignment: -1.0,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('First'),
              ),
              NavigationRailDestination(
                icon: SizedBox.shrink(),
                label: RotatedBox(
                  quarterTurns: -1,
                  child: Text("text"),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Third'),
              ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                            indexSelected = value ? 0 : -1;
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
                            indexSelected = value ? 1 : -1;
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
                            indexSelected = value ? 2 : -1;
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
          ),
        ],
      ),
    );
  }

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
    print(value);
  }
}

Widget _buildTrailing() {
  return Column(
    children: <Widget>[],
  );
}

Widget _buildLeading() {
  return Column(
    children: <Widget>[],
  );
}

Widget _buildBody() {}
