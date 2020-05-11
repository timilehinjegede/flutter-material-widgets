// enum to store the selected type of the group alignment
enum GroupStatus { negativeOne, zero, positiveOne }

// this method gets called when a group alignment property is selected and returns the corresponding value
// the default is set to -1.0 because that is also the default in the Flutter framework
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