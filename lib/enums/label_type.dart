import 'package:flutter/material.dart';

// enum to store the label type of the navigation rail
enum LabelType { none, selected, all }

// this method gets called when a navigation rail label type property is selected and returns the corresponding value
// the default is set to none because that is also the default in the Flutter framework
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
      return NavigationRailLabelType.none;
  }
}
