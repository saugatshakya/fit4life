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
    calories: 71,
    minutes: 20,
    exercises: 28
  ),
  WorkOut(
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

final specialworkouts = [
  WorkOut(
    name: "Full Body",
    time: "18 weeks",
    imagePath: "assets/fullbodygainer.jpg",
    cardio: 2,
    strength: 3,
    calories: 34,
    minutes: 10,
    exercises: 12,
    exercise: [for (int i = 0; i< fullbodygainer.length; i++)fullbodygainer[i]]
  ),
  WorkOut(
    name: "Insane Six Pack",
    time: "12 weeks",
    imagePath: "assets/fullbodygainer.jpg",
    cardio: 3,
    strength: 2,
    calories: 37,
    minutes: 10,
    exercises: 14,
    exercise: [for (int i = 0; i< fullbodygainer.length; i++)fullbodygainer[i]]
  ),
  WorkOut(
    name: "Strong Back",
    time: "12 weeks",
    imagePath: "assets/fullbodygainer.jpg",
    cardio: 1,
    strength: 3,
    calories: 35,
    minutes: 10,
    exercises: 13,
    exercise: [for (int i = 0; i< fullbodygainer.length; i++)fullbodygainer[i]]
  ),
  WorkOut(
    name: "Full Body Streetching",
    time: "22 weeks",
    imagePath: "assets/fullbodygainer.jpg",
    cardio: 2,
    strength: 2,
    calories: 10,
    minutes: 10,
    exercises: 13,
    exercise: [for (int i = 0; i< fullbodygainer.length; i++)fullbodygainer[i]]
  ),
  WorkOut(
    name: "Upper Body Streetching",
    time: "22 weeks",
    imagePath: "assets/fullbodygainer.jpg",
    cardio: 2,
    strength: 2,
    calories: 10,
    minutes: 10,
    exercises: 12,
    exercise: [for (int i = 0; i< fullbodygainer.length; i++)fullbodygainer[i]]
  ),
  WorkOut(
    name: "Lower Body Streetching",
    time: "22 weeks",
    imagePath: "assets/fullbodygainer.jpg",
    cardio: 2,
    strength: 2,
    calories: 10,
    minutes: 10,
    exercises: 12,
    exercise: [for (int i = 0; i< fullbodygainer.length; i++)fullbodygainer[i]]
  ),
];
