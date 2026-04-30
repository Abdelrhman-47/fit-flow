String buildPlanId({required int goalIndex, required String availability}) {
  final goal = _goalKey(goalIndex);
  final days = _daysKey(availability);
  return '${goal}_${days}_days';
}

String _goalKey(int index) {
  const goals = {0: 'muscle', 1: 'strong', 2: 'fitness'};
  return goals[index] ?? '';
}

String _daysKey(String availability) {
  final raw = availability.split(' ').first;
  return raw == '5+' ? '5' : raw;
}
