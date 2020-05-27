class Nutrition {
  final String name, desc, info;
  final List<String> descr;
  final List<Meal> breakfast,lunch,dinner;
  Nutrition({this.name,this.desc,this.descr,this.info,this.breakfast,this.lunch,this.dinner});
}
class Meal{
  final String name,recipe;
  final int cal;
  Meal({this.name,this.recipe,this.cal}); 
}