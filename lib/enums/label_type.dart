
import 'package:flutter/material.dart';

enum LabelType { selected, none, all }

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
