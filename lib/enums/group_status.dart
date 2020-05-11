// enum to store the selected type of the group alignment
enum GroupAlignmentStatus { negativeOne, zero, positiveOne }

// this method gets called when a group alignment property is selected and returns the corresponding value
// the default is set to -1.0 because that is also the default in the Flutter framework
double getGroupValue(GroupAlignmentStatus groupStatus) {
  switch (groupStatus) {
    case GroupAlignmentStatus.negativeOne:
      return -1.0;
      break;
    case GroupAlignmentStatus.zero:
      return 0.0;
      break;
    case GroupAlignmentStatus.positiveOne:
      return 1.0;
      break;
    default:
      return -1;
  }
}