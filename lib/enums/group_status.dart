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