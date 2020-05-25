import 'package:loginapp/models/exercise.dart';

class WorkOut{
  final String name, time, imagePath;
  final int cardio, strength, calories, minutes, exercises;
  final List<Exercise> exercise;

  WorkOut({
    this.name,
    this.time,
    this.imagePath,
    this.cardio,
    this.strength,
    this.calories,
    this.exercises,
    this.minutes,
    this.exercise
  });
}