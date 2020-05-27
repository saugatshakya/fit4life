import 'package:loginapp/models/nutrition.dart';

final Nutrition nutrition = Nutrition(
    name:"Weight Loss",
    desc:"Most people lose a significant amount of weight while on a diet, but the speed depends on the individual. Some tips to lose weight faster are:",
    descr:["Eat a high protein breakfast: Eating a high protein breakfast could reduce cravings and calorie intake throughout the day.", "Avoid sugary drinks and fruit juice: These are among the most fattening things you can put into your body.", "Drink water before meals: One study showed that drinking water a half hour before meals increased weight loss by 44% over 3 months.", "Choose weight-loss-friendly foods: Some foods are better for weight loss than others. Choose them over fatty foods.", "Eat soluble fiber: Studies show that soluble fibers may promote weight loss. Fiber supplements like glucomannan can also help.", "Drink coffee or tea: Caffeine boosts your metabolism by 3-11%.", "Base your diet on whole foods: They are healthier, more filling, and much less likely to cause overeating than processed foods.", "Eat slowly: Eating quickly can lead to weight gain over time, while eating slowly makes you feel more full and boosts weight-reducing hormones.", "Weigh yourself every day: Studies show that people who weigh themselves every day are much more likely to lose weight and keep it off for a long time.", "Get good quality sleep: Sleep is important for many reasons, poor sleep is one of the biggest risk factors for weight gain."],
    info:"Below are the 7-day diet plan for weight loss. You can follow accordingly.",
    breakfast:[for(int i=0;i<breakfast.length;i++)breakfast[i]],
    lunch:[for(int i=0;i<breakfast.length;i++)lunch[i]],
    dinner:[for(int i=0;i<breakfast.length;i++)dinner[i]],
  );

  final breakfast = [
    Meal(
      name: "Green Smoothie",
      recipe: "made with 1/2 banana + 1/2 cup frozen mango + 1 cup kale + 1/2 cup plain, low-fat Greek yougurt + 1/2 small avocado + 1/2 cup nonfat milk",
      cal: 136 
  ),
  Meal(
      name: "Berry Smoothie",
      recipe: "made with 1/2 banana + 1 cup frozen strawberries + 1/2 cup plain, low-fat Greek yogurt + 1/2 cup nonfat milk",
      cal: 250 
  ),
  Meal(
      name: "Green Smoothie",
      recipe: "made with 1/2 banana + 1/2 cup frozen mango + 1 cup kale + 1/2 cup plain, low-fat Greek yougurt + 1/2 small avocado + 1/2 cup nonfat milk",
      cal: 136 
  ),
  Meal(
      name: "Overnight Oats with blueberries",
      recipe: "made with 1/2 cup oats + 1 tablespoon chia seeds + 1/2 cup nonfat milk + 1/2 cup plain, low-fat Greek yogurt + 1/2 cup bluberries",
      cal: 300
  ),
  Meal(
      name: "Overnight Oats with blueberries",
      recipe: "made with 1/2 cup oats + 1 tablespoon chia seeds + 1/2 cup nonfat milk + 1/2 cup plain, low-fat Greek yogurt + 1/2 cup bluberries",
      cal: 300
  ),
  Meal(
      name: "Wheat Toast with boiled eggs",
      recipe: "2 slices whole-wheat toast + 2 hard-boiled eggs + hot sauce (optional)",
      cal: 304
  ),
  Meal(
      name: "Scrambled eggs with beans",
      recipe: "1 scrambled egg + 1/2 cup black beans + 1 whole-wheat tortilla",
      cal: 376
  )
];

final lunch = [
      Meal(
      name: "Vegetable Soup",
      recipe: "It’s made with a light tomato broth and adapts to all seasons. Feel free to use any seasonal vegetables you have on hand.",
      cal: 137
  ),
  Meal(
      name: "Vegetable Soup",
      recipe: "It’s made with a light tomato broth and adapts to all seasons. Feel free to use any seasonal vegetables you have on hand.",
      cal: 137
  ),
  Meal(
      name: "Grilled Chicken",
      recipe: "3 oz grilled chicken + 1/2 cup cooked quinoa + 1 cup cherry tomatoes and chopped cucumber + 2 tablespoons feta cheese + 1 tablespoon vinaigrette",
      cal: 239
  ),
  Meal(
      name: "Steamed Tuna",
      recipe: "3 oz tuna + 2 cups mixed greens + 1 cup cherry tomatoes and chopped cucumber + 1 tablespoon vinaigrette",
      cal: 112
  ),
  Meal(
      name: "Boiled Turkey",
      recipe: "3 oz lean deli turkey + 1/4 avocado + 1 whole-wheat tortilla + 1 cup mixed greens",
      cal: 120
  ),
  Meal(
      name: "Smoled Salmon",
      recipe: "3 oz smoked salmon + 1/4 avocado + 1 whole-wheat tortilla + 1 cup mixed greens",
      cal: 130
  ),
  Meal(
      name: "Turkey with bread",
      recipe: "3 oz lean deli turkey + 1/4 avocado + 2 slices whole-wheat bread + 1 cup mixed greens",
      cal: 110
  )
];

final dinner = [
      Meal(
      name: "Salmon with greens",
      recipe: "4 oz salmon (bake) + 1 cup steamed carrots + 1 cup steamed broccoli + 2 tablespoons teriyaki sauce + 1 teaspoon sesame seeds",
      cal: 220
  ),
  Meal(
      name: "Grilled Chicken with Sweet Potatoes",
      recipe: "4 oz grilled chicken + 1/2 cup roasted sweet potatoes + 1 cup roasted Brussels sprouts + 1 tablespoon olive oil",
      cal: 170
  ),
  Meal(
      name: "Mahi mahi with vegetables",
      recipe: " 4 oz mahi-mahi + 1 cup steamed carrots + 1 cup steamed broccoli + 2 tablespoons teriyaki sauce + 1 teaspoon sesame seeds",
      cal: 140
  ),
  Meal(
      name: "Grilled Chicken with Sweet Potatoes",
      recipe: " 4 oz grilled chicken + 1/2 cup roasted sweet potatoes + 1 cup roasted Brussels sprouts + 1 tablespoon olive oil",
      cal: 170
  ),
  Meal(
      name: "Shrimp with veggie and rice",
      recipe: "4 oz shrimp + 1 cup steamed carrots + 1 cup steamed broccoli + 1/2 cup cooked brown rice + 2 tablespoons teriyaki sauce + 1 teaspoon sesame seeds",
      cal: 160
  ),
  Meal(
      name: "Steak and Potatoes",
      recipe: " 4 oz lean steak + 1 cup roased sweet potatoes + 1 cup roasted Brussels sprouts + 1 tablespoon olive oil",
      cal: 320
  ),
  Meal(
      name: "Whatever You Want",
      recipe: "An example, for fun: 2 slices veggie pizza + 1 cup salad greens + 1 tablespoon vinaigrette + 5 fl oz red wine",
      cal: 302
  )
];

