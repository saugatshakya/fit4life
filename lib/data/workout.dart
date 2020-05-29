import 'package:loginapp/data/exercise.dart';
import 'package:loginapp/models/workout.dart';

final workouts = [
  WorkOut(
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
    name: "Muscle & Strength",
    time: "5 weeks",
    imagePath: "assets/muscle&strength.jpg",
    cardio: 1,
    strength: 3,
    calories: 66,
    minutes: 19,
    exercises: 26,
    exercise: [for (int i = 0; i< musclestrength.length; i++)musclestrength[i]]
  ),
  WorkOut(
    name: "Fit Life Starter",
    time: "5 weeks",
    imagePath: "assets/fitlife.jpg",
    cardio: 1,
    strength: 1,
    calories: 52,
    minutes: 15,
    exercises: 25,
    exercise: [for (int i = 0; i< fitlife.length; i++)fitlife[i]]
  ),
  WorkOut(
    name: "Weight Loss Starter",
    time: "5 weeks",
    imagePath: "assets/weightloss.jpg",
    cardio: 2,
    strength: 1,
    calories: 71,
    minutes: 20,
    exercises: 28,
    exercise: [for (int i = 0; i< weightloss.length; i++)weightloss[i]]
  ),
];

final specialworkouts = [
  WorkOut(
    name: "Full Body",
    time: "18 weeks",
    imagePath: "assets/fullbody.jpg",
    cardio: 2,
    strength: 3,
    calories: 35,
    minutes: 10,
    exercises: 13,
    exercise: [for (int i = 0; i< fullbody.length; i++)fullbody[i]]
  ),
  WorkOut(
    name: "Insane Six Pack",
    time: "12 weeks",
    imagePath: "assets/insanesixpack.jpg",
    cardio: 3,
    strength: 2,
    calories: 34,
    minutes: 10,
    exercises: 13,
    exercise: [for (int i = 0; i< insanesixpack.length; i++)insanesixpack[i]]
  ),
  WorkOut(
    name: "Strong Back",
    time: "12 weeks",
    imagePath: "assets/strongback.jpg",
    cardio: 1,
    strength: 3,
    calories: 36,
    minutes: 10,
    exercises: 13,
    exercise: [for (int i = 0; i< strongback.length; i++)strongback[i]]
  ),
  WorkOut(
    name: "Full Body Stretching",
    time: "22 weeks",
    imagePath: "assets/fullbodystretching.jpeg",
    cardio: 2,
    strength: 2,
    calories: 9,
    minutes: 10,
    exercises: 13,
    exercise: [for (int i = 0; i< fullbodystretching.length; i++)fullbodystretching[i]]
  ),
  WorkOut(
    name: "Upper Body Stretching",
    time: "22 weeks",
    imagePath: "assets/upperbodystretching.jpg",
    cardio: 2,
    strength: 2,
    calories: 10,
    minutes: 10,
    exercises: 12,
    exercise: [for (int i = 0; i< upperbodystretching.length; i++)upperbodystretching[i]]
  ),
  WorkOut(
    name: "Lower Body Stretching",
    time: "22 weeks",
    imagePath: "assets/lowerbodystretching.jpg",
    cardio: 2,
    strength: 2,
    calories: 9,
    minutes: 10,
    exercises: 12,
    exercise: [for (int i = 0; i< lowerbodystretching.length; i++)lowerbodystretching[i]]
  ),
];
final upperlower = [
  WorkOut(
    name: "Upper Body",
    time: "6 weeks",
    cardio: 2,
    strength: 2,
    calories: 9,
    minutes: 10,
    exercises: 13,
    exercise: [for (int i = 0; i< upperbodystretching.length; i++)upperbodystretching[i]]
  ),
  WorkOut(
    name: "Lower Body",
    time: "6 weeks",
    cardio: 2,
    strength: 2,
    calories: 10,
    minutes: 10,
    exercises: 12,
    exercise: [for (int i = 0; i< lowerbodystretching.length; i++)lowerbodystretching[i]]
  ),
];
