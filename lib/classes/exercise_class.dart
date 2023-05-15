class Exercice {
  final String name;
  // final String reps;
  final String sets;

  List<int>? weights = [];
  List<int>? reps = [];

  Exercice({
    required this.name,
    required this.sets,
    this.weights,
    this.reps,
  });
  void addWeight(List<int> newWeights) {
    weights = newWeights;
  }

  void addReps(List<int> newReps) {
    reps = newReps;
  }

  Exercice.withWeight({
    required this.name,
    this.reps,
    required this.sets,
    required this.weights,
  });
}
