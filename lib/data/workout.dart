import 'package:loginapp/data/exercise.dart';
import 'package:loginapp/models/workout.dart';

final workouts = [
  WorkOut(
    id: "fullbodygainer",
    name: "Full Body Gainer",
    time: "12 weeks",
    imagePath: "assets/fullbodygainer.jpg",
    cardio: 1,
    strength: 3,
    calories: 71,
    minutes: 20,
    exercises: 28,
    exercise: [for (int i = 0; i< fullbodygainer.length; i++)fullbodygainer[i]]
  ),
  WorkOut(
    id: "muscle&strength",
    name: "Muscle & Strength",
    time: "5 weeks",
    imagePath: "assets/muscle&strength.jpg",
    cardio: 1,
    strength: 3,
    calories: 71,
    minutes: 20,
    exercises: 28
  ),
  WorkOut(
    id: "fitlifestarter",
    name: "Fit Life Starter",
    time: "5 weeks",
    imagePath: "assets/fitlife.jpg",
    cardio: 1,
    strength: 1,
    calories: 71,
    minutes: 20,
    exercises: 28
  ),
  WorkOut(
    id: "weightlossstarter",
    name: "Weight Loss Starter",
    time: "5 weeks",
    imagePath: "assets/weightloss.jpg",
    cardio: 2,
    strength: 1,
    calories: 71,
    minutes: 20,
    exercises: 28
  ),
];