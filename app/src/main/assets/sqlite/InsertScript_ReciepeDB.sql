CREATE TABLE Meal (
    idMeal      [INT]             NOT NULL
                                  PRIMARY KEY,
    idCategory  [INT]             NOT NULL
                                  REFERENCES Category (id),
    ingredients [NVARCHAR] (4000),
    steps       [NVARCHAR] (4000),
    calories    [INT]             NOT NULL,
    prepTime    [INT]             NOT NULL,
    mealImage   [NVARCHAR] (15),
    name        [NVARCHAR] (64)   NOT NULL
);

CREATE TABLE Category (
    id    [INT]           NOT NULL
                          PRIMARY KEY,
    value [NVARCHAR] (15) NOT NULL
);

INSERT INTO [Category] ([id], [value]) VALUES (1,'Breakfast');
INSERT INTO [Category] ([id], [value]) VALUES (2,'Breakfast snack');
INSERT INTO [Category] ([id], [value]) VALUES (3,'Lunch');
INSERT INTO [Category] ([id], [value]) VALUES (4,'Lunch snack');
INSERT INTO [Category] ([id], [value]) VALUES (5,'Dinner');

INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (1, 1, '2 strips bacon
2 eggs
1 flour tortillas
1 slice cheddar cheese', 'On medium heat, fry bacon on skillet or frying pan until crispy, about 5-10 minutes. Remove bacon from frying pan and drain excess fat
Beat eggs in mixing bowl. Pour eggs onto same frying pan on medium heat. As eggs begin to set, begin to gently pull eggs across to pan to form curds. Continue cooking the eggs and gently pull and fold the eggs until they begin to set. Continue this process until no liquid remains. Do not stir constantly. About 2 minutes. Add cheese on top of scrambled eggs to begin melting and remove from heat. Leave pan on stovetop still on medium heat.
Place tortilla on flat surface. Add eggs with cheese and bacon onto tortilla. Fold together to create a wrap so ingredients dont spill out. Place wrap fold side down on pan to create a seal. After 1 minute flip wrap over to brown other side. Serve hot.', 330, 15, 'm1', 'BACON, EGG, & CHEESE BREAKFAST WRAP');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (2, 1, '2 eggs
2 tablespoons milk (or water)
0 salt
3 teaspoons butter (room temperature, divided)
4 slices whole wheat bread (white bread)
2 slices Marble Jack cheese
4 slices bacon (fully-cooked)', 'BEAT eggs, milk, salt and pepper in small bowl until blended.
HEAT 1 tsp. butter in large nonstick skillet over medium heat until hot. POUR IN egg mixture. As eggs begin to set, GENTLY PULL the eggs across the pan with an inverted turner, forming large soft curds. CONTINUE cooking – pulling, lifting and folding eggs – until thickened and no visible liquid egg remains. Do not stir constantly. REMOVE from pan. CLEAN skillet.
SPREAD remaining 2 tsp. butter evenly on one side of each bread slice. PLACE 2 slices in skillet, buttered side down. TOP evenly with scrambled eggs, cheese and bacon. COVER with remaining bread, buttered side up.
GRILL sandwiches over medium heat, turning once, until bread is toasted and cheese is melted, 2 to 4 minutes.', 630, 15, 'm2', 'Bacon & Egg Breakfast Grilled Cheese');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (3, 1, '1 cup orange juice
1/2 cup nonfat vanilla greek yogurt
1 bananas
2 cups ice', 'Put everithing in the robot and mix for 1 min.', 170, 15, 'm3', 'Orange Banana Breakfast Smoothie');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (4, 1, '50 grams rolled oats
120 milliliters espresso (Califia Farms XX)
120 milliliters unsweetened almond milk (Califia Farms)
25 grams blueberries
1/3 bananas (sliced)
2 teaspoons peanut butter
1 teaspoon chia seeds', 'Mix rolled oats with Califia Farms xx espresso and unsweetened almond (can refrigerate overnight or serve immediately).
Top with sliced banana, peanut butter and blueberries. Sprinkle with chia seeds', 320, 15, 'm4', 'California Breakfast Bowl');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (5, 1, '5 dates
4 tablespoons honey
2 teaspoons coconut oil
1 cup rolled oats
1 tablespoon chia seeds
1 tablespoon flax seeds
1/2 cup greek yogurt
1 cup mixed fruit
1 tablespoon sliced almonds', 'Remove the seeds from the dates and allow them to soak in water for about 10 - 20 minutes.
Preheat oven to 350 degrees.
In a small blender, blend the dates with the honey and coconut oil until a paste is formed.
Add in the rolled oats and seeds. Blend until the mixture has formed a dough texture.
Lightly grease a muffin pan with coconut oil and press the dough into the pan, shaping it into small tart shells. This recipe should make about 6 shells.
Bake for about 10-12 minutes, or until the shells are lightly browned on the edges.
Remove from heat and let cool.
Top each breakfast tart shell with yogurt, fruit, and nuts! Enjoy!', 170, 15, 'm5', 'Fruit & Nut Breakfast Tarts');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (6, 1, '1/2 cup quinoa (rinsed)
3/4 cup light coconut milk (canned, + more for drizzling)
2 teaspoons vanilla extract
1/2 teaspoon cinnamon (+ more for sprinkling)
1 pinch salt
1 bananas (chopped)
1/3 cup toasted pecans (chopped)', 'Combine quinoa, coconut milk, cinnamon and vanilla in a small saucepan and bring to a boil. Reduce to a simmer, cover, and let cook for 15 minutes until quinoa can be fluffed with a fork.
Divide quinoa into two bowls then cover with bananas, pecans, and a few extra drizzles of coconut milk.', 550, 30, 'm6', 'Coconut Milk Breakfast Quinoa');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (7, 1, '2 cups white cornmeal (P.A.N. precooked)
2 1/2 cups water
1 teaspoon salt
garlic butter
8 eggs (scrambled)
8 slices bacon (cooked)', 'In a large bowl, add the water and salt; stir to combine.
Slowly pour in the cornmeal and mix for 1-2 minutes until the dough is smooth.
Divide dough into 8 even pieces; form each piece into a disc that is 4-5 inches in diameter.
Heat a greased grill pan over medium-high heat.
Add Arepas and cook for 5 minutes on each side.
Remove cooked Arepas from pan and slice across the middle.
Spread an even layer of garlic butter on each half.
Place 1/8 of the scrambled egg and 1 slice of bacon on the bottom half of the Arepa and top with the remaining half.
Repeat for remaining Arepas.', 370, 30, 'm7', 'Breakfast Arepas');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (8, 1, '2 baking potatoes (large, cooked and cooled, see note below for instructions)
1/2 cup shredded cheddar cheese
cracked peppercorn
fine sea salt
2 tablespoons fresh chives
2 large eggs
1 strip bacon (cooked and minced)', 'Heat oven to 400 degrees. Cut the tops off baking potatoes. Using a spoon, hollow out leaving a 1/8 of potato along the edges and resulting in a potato boat.
Set aside the tops and the innards to make Home Fries for another meal.
Place a pinch of cheddar cheese, 1/4 of bacon, 1/2 tablespoon minced vegetables and a few grinds of salt and pepper in the bottom of each potato boat.
Crack egg directly into the potato boat. Carefully place potato boats onto an aluminum lined baking sheet.
Bake for 10 minutes or until whites have set.
Remove and allow to cool for 3-4 minutes before serving. Enjoy!', 350, 30, 'm8', 'Breakfast Potatoes');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (9, 1, 'white bread
american cheese slices (White)
american cheese slices (Yellow)
ham (Sweet, deli sliced)
eggs
butter', 'Place slice of white American on one side of the bread and place slice of yellow American on opposite slice. Top each side with a thin piece of honey ham. Have all your bread assembled so as you remove the eggs from the pan you are ready to go.
Cook one egg over easy per sandwich, Remove from the pan without over cooking and gently bring the sides of the sandwich together. DO NOT PRESS DOWN OR YOU WILL BREAK THE YOLK. Heat skillet over medium low heat. Top each sandwich with butter pats. Place butter side down in skillet. Cook until bread is browned. Add pats of butter to uncooked side. Flip and cook until sandwich is browned and cheese is gooey and melted.', 400, 30, 'm9', 'Easy Breakfast Grilled Cheese');

INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (10, 2, '1/4 cup skippi natur super chunk peanut butter spread
1 tablespoon honey
1 granny smith apples (large, cored)
2 tablespoons cranberries', 'Combine Skippy Natural Super Chunk Peanut Butter Spread with honey in small bowl; set aside.
Cut 1/2-inch from top and bottom of apple; discard. Cut remaining apple into 4 horizontal slices. Spread 2 slices with peanut butter mixture. Sprinkle with cranberries, then top with remaining apple.', 260, 15, 'm10', 'Apple bagel Snacks');

INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (11, 2, '1/2 cup almond butter
6 tablespoons brown rice syrup
1 cup oats (ground into a flour***)
1/4 cup coconut flour
1/2 cup quick oats
1/2 cup Crispy Rice Cereal
2 tablespoons unsweetened almond milk (if needed)
1/4 cup snack chips (chocolat, for melting)', 'Add the almond butter and brown rice syrup to a small bowl and stir until combined. Set aside.
Combine the oat flour, coconut flour, quick oats, and crispy rice cereal in a large mixing bowl, stirring until well combined. Pour the wet ingredients into the dry ingredients and mix until fully incorporated. The mix might seem a little dry and tough to work with at first, but continue mixing until the ingredients start to incorporate, adding 1-2 tbsp (15-30 ml) of almond milk to soften it up, if needed.
Using a heaping tablespoon, roll the dough between your hands to form individual balls. Set them aside on a large baking sheet lined with parchment paper, and repeat with the remaining dough.
To prepare the chocolate drizzle, melt the chocolate chips in the microwave or over a double broiler, stirring periodically to ensure no clumps remain. Use a spoon to drizzle the chocolate over each ball, and sprinkle with any desired toppings.
Refrigerate for ~15 minutes, or until the chocolate has set. Store the bites in an airtight container in the fridge for up to 2 weeks.', 140, 15, 'm11', 'Almond Crisp Snack Bites');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (12, 2, '1/2 avocado
1/3 cup greek yogurt
1/2 teaspoon paprika
1/2 teaspoon salt
1/2 teaspoon garlic powder', 'Place the yogurt in the empty pit part of the avocado half. Sprinkle with all the seasonings and enjoy.', 60, 15, 'm12', 'Power Snack');

INSERT  [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (13, 2, '1 can chickpeas (drained and rinsed)
1/2 cup tahini
1 avocado (diced)
2 cloves garlic (minced)
1 tablespoon lemon juice
1/2 teaspoon salt
1/4 cup water 
sun-dried tomatoes (Antipasto or sliced, optional topping)
carrot sticks
celery sticks
cucumber
crackers
snack chips', 'Add all ingredients with the exception of antipasto/veggies/crackers to your Vitamix. Blend on the lowest speed for 30 seconds, removing lid as necessary to stir. Continue blending on low speed until fully mixed together - the whole process should take about 5 minutes.
Scoop out into jam jars, and top with antipasto or sundried tomatoes. Serve alongside cut up veggies, crackers, chips or whatever other snacks you are craving. Enjoy within the first 2-3 days of serving.', 500, 15, 'm13', 'Avocado Hummus Snack Jars');

INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (14, 2, '1 1/2 cups plain greek yogurt
3 tablespoons maple syrup
1/2 cup granola (Quaker® Real Medleys SuperGrains Blueberry Pecan)
1/2 cup blueberries
4 strawberries', 'Line a baking sheet with parchment paper and set aside.
Mix Greek yogurt and syrup in a bowl until combined. Pour onto prepared baking sheet and spread into a thin layer. Top with Real Medleys SuperGrains Blueberry Pecan Granola, blueberries, and strawberries.
Cover the baking sheet with a piece of aluminum foil. Place in the freezer for two hours, or overnight, until the bark is fully frozen. Slice into desired squares. Serve immediately and keep stored in the freezer in an airtight container or bag.', 90, 120, 'm14', 'Greek Yogurt Breakfast Bark');

INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (15, 2, 'apples (any variety, washed,cored and sliced into wedges or rounds. If serving as an appetizer to adults, the apples can be whole and cut by guests.)
nuts
pecans
cheese (Bleu, crumbled)
honey (enough to dip or drizzle on the apple pieces)', 'Either dip or drizzle apple pieces with honey, roll in nuts or sprinkle with crumbled bleu cheese, serve immediately', 180, 15, 'm15', 'Apple Snacks');

INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (16, 2, 'biscuits (1, 12-oz. can Pillsbury Grands! Jr. Golden Layers® refrigerated flaky original)
3/4 cup pizza sauce
80 pepperoni slices (from two 3.5-oz. pkg.)
4 ounces shredded mozzarella cheese', 'Heat oven to 400°F. Lightly grease cookie sheets.
Separate dough into 10 biscuits. Separate each biscuit into 4 layers; place on greased cookie sheets. Spread each biscuit layer with 1 teaspoon pizza sauce. Top each with 2 pepperoni slices and about 2 teaspoons cheese.
Bake at 400°F. for 7 to 9 minutes or until biscuits are golden brown.', 30, 30, 'm16', 'Flaky Biscuit Pizza Snacks');

INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (17, 2, '2/3 cup fresh lemon juice or fresh orange juice (if you dont like sour go with orange, but I definitely prefer the lemon!)
2/3 cup frozen or fresh berries (raspberries, blueberries, strawberries are all great.)
1 - 2 Tbs honey
5 Tbs gelatin', 'Pour juice and berries into a small saucepan. Heat over medium heat, stirring occasionally until berries become tender and begin to soften.
Add honey and stir until completely incorporated. You will want the fruit to dissolve quite a bit until you have a compote.
Turn the heat off, and quickly whisk in gelatin one tablespoon at a time. Whisk vigorously until completely incorporated, mixing the gelatin in very gradually to avoid lumps.
Puree mixture using a immersion blender or small blender (my magic bullet works great for this! Just be sure to cool slightly before moving over.)
Pour into a 8 x 8 or 9 x 9 glass dish. Refrigerate until set (30 minutes to an hour). Cut in small squares.', 20, 30, 'm17', 'Homemade Healthy Fruit Snacks');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (18, 2, '2 bananas (ripe)
2 eggs
1/4 teaspoon baking powder
1/4 teaspoon vanilla
1 tablespoon cocoa powder
1 tablespoon protein powder (optional)', 'Break up the bananas and mash them in a medium bowl with a potato masher. Add eggs, baking powder, vanilla, cocoa powder, and optional protein powder and mix until combined.
Heat a skillet over medium heat and melt butter or add spray. Drop about 2 tablespoons of batter onto the pan and cook for about 1 minute until browned and then gently flip and cook for 30 seconds.', 110, 30, 'm18', 'Snack Girl');

INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (19, 2, '2 pounds carrots (Pick the fattest carrots you can find.)
1/4 cup olive oil (or melted coconut oil)
1 tablespoon sea salt
1 teaspoon ground cumin
1 teaspoon ground cinnamon', 'Preheat the oven to 425 degrees F. Line several large baking sheets with parchment paper and set aside.
Trim the carrot tops off. Starting on the thick end slice the carrots paper-thin on the bias to create elongated slices. You can do this with a chefs knife, but it’s better to use a mandolin slicer on the smallest setting. When you get down to the thin end, stop and save them to use in soup or salad.
Place the carrot slices in a large bowl and add the oil, salt, cumin, and cinnamon. Toss well to thoroughly coat. Then lay the slices in a single layer on the baking sheets.
Bake for 12-15 minutes, until the edges start to curl up and turn crisp. Then flip all the chip over and bake another 5-8 minutes to crisp the bottoms. Once cool, store in an airtight container for up to 2 weeks.', 110, 30, 'm19', 'Healthy Baked Carrot Chips');

INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (20, 2, '15 ounces garbanzo beans
1 tablespoon olive oil
1 tablespoon cheese (popcorn, powder)
1 pinch seasoning (chile-lime)
1 pinch salt', 'Preheat the oven to 400 degrees.
Drain the garbanzo beans and rinse well. Drain to remove as much moisture as possible.
Spread the garbanzo beans on a baking sheet and drizzle with oil. Bake at 400 degrees until they are crisp and toasted, about 45 minutes, checking them every 15 minutes and moving them around on the pan so they cook evenly.
When they are done, transfer to a bowl and sprinkle with the cheese powder, chili powder, and salt. Stir to combine.
These are nice while they are still warm, and are just as good when they have cooled.', 420, 30, 'm20', 'Crunchy Garbanzo Snacks');

INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (21, 3, '2 1/2 cups bow-tie pasta (uncooked)
6 cups romaine lettuce (torn)
1 medium tomatoes (diced)
4 bacon slices (cooked and crumbled)
1/2 cup ranch dressing
1 tablespoon barbecue sauce
1/4 teaspoon pepper', 'Cook pasta according to package directions. Drain. Then rinse pasta under cold water.
In a large bowl, combine the romaine lettuce, tomato, bacon and pasta.
Drizzle the ranch dressing and barbecue sauce over the top. Gently toss to coat evenly. Season with pepper. Serve immediately and enjoy!', 290, 15, 'm21', 'BLT Pasta Salad');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (22, 3, '2 cups boiling water
3 noodles
meal
noodles (Jars, for each jar)
2 tablespoons ketchup
2 tablespoons peanut butter
1 tablespoon fish sauce
1 tablespoon fresh ginger (grated)
1 teaspoon tamari soy sauce
1/2 lime
1/4 teaspoon hot sauce (your favourite)
1 carrots (shredded)
1 handful beansprouts (fresh)
mint
basil
cilantro
1 green onions (sliced)
1 package noodles', 'Place ketchup, peanut butter, fish sauce, ginger, tamari, lime and hot sauce in large mason jar. Whisk together. Top with carrot, bean sprouts, herbs and green onion. Before opening instant noodles, squeeze package to break apart. Discard weird flavour packet and top jar with noodles. Screw on lid and refrigerate until ready to serve.', 140, 15, 'm22', 'Quick Weekday Lunch - Noodle Jars');

INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (23, 3, '2 slices bacon
2 slices sourdough bread
1 tablespoon butter (room temperature)
1/2 cup jack cheese (shredded)
2 tablespoons guacamole (room temperature)
1 tablespoon tortilla chips (crumbled, option', 'Cook the bacon until crispy and set aside on paper towels to drain.
Butter one side of each slice of bread, sprinkle half of the cheese onto the unbuttered side of one slice of bread followed by the guacamole, bacon, tortilla chips, the remaining cheese and finally top with the remaining slice of bread with the buttered side up.
Grill over medium heat until golden brown and the cheese has melted, about 2-3 minutes per side.', 960, 15, 'm23', 'Bacon Guacamole Grilled Cheese Sandwich');

INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (24, 3, '4 cod fillets
1/4 cup egg substitute
1/4 cup Special K Cereal (finely ground)
1/2 teaspoon italian seasoning (dried)
1/4 cup parmesan cheese (grated)
french fries (cooked)
sauce (Tarter)', 'Preheat the oven to 450 degrees.
Rinse the fish and pat dry.
In a shallow bowl, place the egg substitute.
In a different shallow bowl, mix the crumbs, Italian seasoning, and Parmesan cheese.
Grease a cookie sheet.
Dip fish in egg substitute and into crumbs, making sure to coat both sides.
Place fish on baking sheet and spray with oil.
Bake for 12 to 15 minutes.
Serve with french fries and tarter sauce.', 500, 15, 'm24', 'Crispy Baked Fish and Fries');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (25, 3, '7 containers tuna (in Water Strained, 6 oz)
3/4 cup mayonnaise
160 grams celery
140 grams green pepper
25 grams green onions
3/4 cup relish (Sugar Free)
3 large eggs (Hardboiled)', 'Hardboil 3 eggs
Open tuna and strain out the water
Flake tuna in large bowl (break up with fork)
Add all ingredients and mix', 170, 15, 'm25', 'Tuna Salad');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (26, 3, '1 pound chicken breasts (cut into bite-sized pieces)
1 large eggs (extra, whisked)
2 cups pretzels (honey mustard, pieces, crushed, either by hand or with food processor)
honey mustard sauce (for dipping)', 'Preheat oven to 400F. Set whisked egg aside in a small bowl. Set crushed pretzels in a separate bowl. Working one by one, dip chicken first in egg and then roll in pretzel pieces until fully coated. Place on baking sheet lined with parchment paper. Repeat until all chicken is finished.
Bake chicken for about 15-20 minutes until chicken is fully cooked and pretzel coating is a dark golden brown. Serve with honey mustard sauce.', 280, 30, 'm26', 'Honey Mustard Pretzel Chicken Bites');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (27, 3, '500 grams chestnut mushrooms (organic)
1 large garlic cloves
1/2 tablespoon olive oil
1/4 teaspoon ground turmeric
1 pinch Himalayan salt (pink)
pepper (to taste)
parsley (to garnish)', 'Wash the mushrooms thoroughly and chop them into desired size.
Place a nonstick pan over medium heat and put in the chopped mushrooms with some salt, freshly ground pepper and turmeric powder. Cook for about 12-15 min until water has all run out.
Crush and chop the garlic, add it to the mushrooms along with the olive or the coconut oil and cook for further 2 minutes tossing occasionally.
Remove from heat, sprinkle some parsley on top, crush some pepper and enjoy.', 50, 30, 'm27', 'Garlic Infused Mushrooms');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (28, 3, '1/2 pound bacon
3 russet potatoes (extra large, peeled and chopped into 1/2"-3/4" pieces, about 6 cups worth)
1 teaspoon kosher salt
3/4 teaspoon freshly ground black pepper
1 1/2 cups shredded cheddar cheese (or Mexican blend shredded cheeses)
3 green onions (sliced thin)', 'COOK THE BACON: Spread the bacon strips out across a large rimmed baking sheet pan and place on the middle rack of a COLD oven. Set the temperature to 400 degrees. Set a timer for 16 minutes and check the bacon. Remove it from the oven when it is as crisp or crunchy as you like. I remove ours at 18 minutes and its a great balance of chewy crunch. If you like your bacon crispy enough to crumble, you will probably want to cook it another minute past that.
COOK THE POTATOES: While the bacon is cooking, peel and chop the potatoes. Transfer the bacon to a paper towel lined plate to drain. There should be 2-3 tablespoons of bacon grease left on the sheet pan. (If there is more than that, drain off a bit.) Put the potatoes on the pan and toss with tongs to thoroughly coat them in the bacon grease. Sprinkle with salt and pepper. Spread the potatoes out in a single layer and bake for 20 minutes, stir well and bake an additional 20 minutes. Stir again, making sure that none of the potatoes are sticking to the tray. Bake another 15 minutes.
Chop the bacon into small pieces. Remove the potatoes from the oven, stir again and sprinkle generously with shredded cheese and chopped bacon. Return the tray to the oven and bake an additional 2-3 minutes, until the cheese has melted. Top with sliced green onions just before serving. Enjoy!', 370, 60, 'm28', 'Crispy Cheese and Bacon Potatoes');

INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (29, 3, '1 tablespoon olive oil (or oil of choice)
2 teaspoons ginger (freshly grated (or 1 teaspoon dried ground ginger))
2 cloves garlic (minced, or 1/2 teaspoon dried ground)
2 carrots (small (or about 1/2 cup) chopped in smaller thin pieces so it cooks quickly)
1 head broccoli (chopped into small florets, you can also use some of the peeled stem if you chop into small pieces so that it cooks quickly)
salt (to taste)
pepper (to taste)
1 tablespoon water
1 cup brown rice (cooked)
1 teaspoon curry powder (or to taste for your desired heat level)
1 cup fresh spinach (chopped, optional)', 'Make sure you have all of your items chopped and ready to go as this recipe is going to go fast. In a wok or frying pan, add your oil and heat to medium high heat. Add your fresh ginger and garlic (please note if you are using dried ground ginger and garlic add these only after you have added your vegetables to the wok) and stir fry just until aromatic then quickly add your carrots and broccoli. Keep stirring and keep the items in your wok moving. Add salt and pepper to taste and add 1 tablespoon of water and put on lid for about 1 minute, just to do a flash steam of your veggies. DO NOT overcook. You want your vegetables to be crisp aldente. (You can use any vegetables you have in your crisper for this recipe)
2 Remove lid from your wok/frying pan and toss your veggies. The water should be evaporated. Add the cooked brown rice and curry powder and toss until all of the rice is well coated. (If your rice starts to stick then add just a touch more olive oil). Add a handful of spinach and just toss until wilted about 1 minute. Taste test your stir fry and adjust seasoning as desired.', 280, 30, 'm29', 'Vegan Curried Rice');

INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (30, 3, '8 ounces (1 small-to-medium bundle, 225 grams) fresh broccoli (3 cups chopped)
1 large egg
1/2 cup (65 grams) all-purpose flour
1/3 cup (30 grams) finely grated parmesan cheese
1 small clove garlic, minced
1/2 teaspoon Kosher salt, plus more to taste
A pinch of red pepper flakes or several grinds of black pepper
Olive or vegetable oil for frying', 'In the bottom of a large bowl, lightly beat your egg. Add the flour, cheese, garlic, salt and pepper. Then, add the somewhat cooled broccoli and, using a potato masher, mash the broccoli just a bit. You’re looking to keep the bits recognizable, but small enough (1/4- to 1/2-inch chunks) that you can press a mound of the batter into a fritter in the pan. Once mashed a bit, stir or fold the ingredients together the rest of the way with a spoon. Adjust seasonings to taste.', 80, 30, 'm30', 'Broccoli Parmesan Fritters');

INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (31, 4, '1/2 cucumber (chopped)
1/2 teaspoon dried dillweed
1 ounce Hidden Valley Original Ranch Salad Dressing & Seasoning Mix (1 packet)
2 cups sour cream (or substitute Greek yogurt)
0snack chips (and/or sliced vegetables)', 'Combine all ingredients in a bowl. Mix well. Best if chilled overnight. Serve with chips and vegetable dippers', 230, 15, 'm31', 'Ranch Cucumber Dip');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (32, 4, 'sweet potatoes
olive oil
salt
pepper', 'Take a piece of parchment paper ~the size of your microwave turntable plate and fold/trim as necessary so that the paper rotates freely while the microwave is running - you dont want the paper to get caught and crumple. it will take your potatoes with it.
Using a mandoline on the thinnest setting, slice the sweet potato.
Lightly spray the parchment with olive oil, and, working in batches, spread the sweet potato slices in a single layer.
Lightly spray again with olive oil and then sprinkle with salt and pepper.
Microwave for 4:00 on Power Level 9', 80, 15, 'm32', 'Microwave Sweet Potato Chips');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (33, 4, '1/3 cup seedless watermelon (finely diced)
1 avocado (ripe)
1/4 cup feta cheese crumbles
1/2 teaspoon lime juice
1 baguette ', 'To a medium mixing bowl add the watermelon, avocado, feta, and lime juice. Gently stir everything together until well combined.
Lay out your toasts on a serving platter. Spoon a couple tablespoons of the watermelon mixture on top of each toast. (You can use as much or as little of the topping as you like, but the amount you use will cause the total number of bruschetta this recipe makes to vary.)', 35, 15, 'm33', 'Watermelon & Avocado Bruschetta');

INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (34, 4, '1/4 cup plain greek yogurt
1 teaspoon dijon mustard
1/4 teaspoon salt
1/8 teaspoon black pepper
1/8 teaspoon garlic powder
1/8 teaspoon dried dillweed
5 ounces albacore tuna in water (drained)
1 cup frozen peas ', 'In a bowl, add Greek yogurt, Dijon mustard, salt, pepper, garlic powder, and dill weed. Stir to combine.
Add tuna, peas, red onion, and bell pepper. Toss to coat. 
Serve chilled over mixed greens as a salad, in a wrap, with crackers as an appetizer, or alone.', 160, 15, 'm34', 'High Protein Sweet Pea and Dill Tuna Salad');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (35, 4, '2 pounds broccoli florets
1 large carrots (peeled and shredded)
1/2 red onion (diced)
1 apples (large, finely chopped)
1/4 cup raisins', 'In a large bowl mix together broccoli, carrot, onion, apple, and raisins. In a small bowl, whisk together yogurt, mayonnaise, and lemon juice.
Pour dressing onto salad and adjust seasonings. Enjoy now or keep in the fridge for up to one week.', 90, 15, 'm35', 'Broccoli Apple Salad');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (36, 4, '2 sweet mini bells
1 cheese (stick)
1 teaspoon dried parsley', 'Preheat oven to "broil".  Remove tops and seeds from mini-peppers.  Cut cheese stick in half.  Place one half in each mini-pepper.  Broil for 7-10 minutes.  Remove from oven, sprinkle with dried parsley, and ENJOY!', 240, 30, 'm36', 'Cheese-Stuffed Mini-Peppers');

INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (37, 4, '1 cup plain yogurt
2 tablespoons honey
1 cup fresh blueberries
1/2 cup slivered almonds', 'It’s really as simple as mixing up the first two ingredients ’til blended, then folding in the last two. Actually, breaking up the fresh blueberries is encouraged.', 170, 30, 'm37', 'Blueberry Yogurt Protein Bites');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (38, 4, '2 bananas
170 grams dates (chopped)
180 grams oats
40 grams oil (I used vegetable but coconut oil would be great)
40 grams sunflower seeds
2 tablespoons chia seeds
1 teaspoon vanilla extract', 'Preheat the oven to 170C
Mash up the bananas with a fork.
Mix in all the other ingredients and press into a greased cake tin.
Bake in the oven at 170c for 25 minutes.
When the bars come out of the oven, cut them into squares but leave in the tin to cool.', 130, 30, 'm38', 'Date and Banana Oaty Bars');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (39, 4, '1/2 cup apples (dehydrated)
1/2 cup dates
1/2 cup raw almonds
2 teaspoons cinnamon', 'Place all ingredients into a food processor on high for 45 seconds-60 seconds or until ingredients are almost smooth and start to form a ball.
Separate mixture into 14 evenly sized balls.
Sprinkle with more cinnamon.
Store in an airtight container.', 190, 30, 'm39', 'Cinnamon Apple Pie Energy Bites');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (40, 4, '2 cups full fat coconut milk
1/4 cup gelatin 
1/4 cup coconut creams
2 bananas (large ripe, about 1½ -2 cups, mashed)
1 teaspoon vanilla extract', 'In small saucepan, sprinkle gelatin over coconut milk and let set until soaked.
When soaked, turn heat to low and dissolve gelatin.
Stir in coconut cream until melted.
Pour mixture into a blender and add bananas and vanilla.
Puree and pour into a 9x13 inch pan.
Refrigerate until set.
Cut into squares and devour!
Store leftovers in a covered container in the fridge.', 430, 30, 'm40', 'Banana Creme Fruit Snacks');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (41, 4, '1 1/2 cups rolled oats (large)
1 cup whole wheat flour (60%. You can use all-purpose flour if you prefer)
3 teaspoons baking powder
1/2 teaspoon salt
1 1/2 teaspoons cinnamon
1/2 teaspoon nutmeg
2 eggs
4 tablespoons vegetable oil
6 tablespoons sugar
2/3 cup milk
1 cup bananas (mashed ripe)
1 cup apples', 'Mix together the oatmeal, whole wheat flour, baking powder, salt,cinnamon and nutmeg. Set aside.
Beat together the eggs. oil and sugar until fluffy.
Blend in the milk.
Fold in the dry ingredients and when the flour is almost incorporated fold in the mashed banana and grated apple.
Do not over mix. Fold in only until the fruit is mixed through the batter.
Spoon into greased or paper lined muffin tins and bake at 350 degrees F for 25 minutes or until a toothpick inserted in the center comes out clean. Best served warm.', 180, 30, 'm41', 'Oatmeal Apple Banana Low Fat Muffins');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (42, 5, '2 baking potatoes (peeled, rinsed, and chopped)
2 tablespoons canola oil
1 pinch salt
1 pinch parsley (optional)
1/2 tablespoon parmesan cheese ', 'In a medium skillet (cast iron preferred), heat canola oil over medium.
Add chopped potatoes to the skillet in an even layer. Allow to pan fry in the oil for a handful of minutes, or until the potatoes start to brown. Basically you are going to flip the potatoes around to all sides for as even of a browning as you can get. Allow each side to brown before moving them around. I practice my patience when I do this. Recognize that each potato may cook at different times.
Using a slotted spoon, transfer potatoes to a plate lined with a paper towel. Sprinkle with salt, parsley (optional) and cheese (optional).', 230, 15, 'm42', 'The Best Pan-Fried Breakfast Potatoes');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (43, 5, '3 cups cooked rice
2 tablespoons sesame oil
1 white onion (small, chopped)
1 cup frozen peas and carrots (thawed)
3 tablespoons soy sauce (more or less to taste)
2 eggs (lightly beaten)
2 tablespoons green onions', 'Preheat a large skillet or wok to medium heat. Pour sesame oil in the bottom. Add white onion and peas and carrots and fry until tender.
Slide the onion, peas and carrots to the side, and pour the beaten eggs onto the other side. Using a spatula, scramble the eggs. Once cooked, mix the eggs with the vegetable mix.
Add the rice to the veggie and egg mixture. Pour the soy sauce on top. Stir and fry the rice and veggie mixture until heated through and combined. Add chopped green onions if desired.', 70, 15, 'm43', 'Easy Fried Rice');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (44, 5, '12 ounces green beans (trimmed, make sure they are dry)
2 teaspoons olive oil
kosher salt
cracked black pepper
1/4 teaspoon garlic powder
1 1/2 tablespoons shredded parmesan cheese', 'Preheat the oven to 425°F. Line a baking sheet with aluminum for easy clean-up.
Lay green beans out on the baking sheet and drizzle oil over them. Season with salt, pepper and garlic powder and toss to evenly coat.
Spread them out on the sheet so that they all lay flat and place on the lower third section of your oven.
Bake 10 minutes, shake the pan to turn; bake 5 additional minutes.
Remove from the oven and sprinkle with grated cheese.', 60, 15, 'm44', 'Roasted Parmesan Green Beans');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (45, 5, '1 pound salmon fillets
1 tablespoon honey
3 cloves garlic (minced)
sea salt (to taste)
cracked black pepper ', 'Heat oven to 400°F. Line a baking sheet with parchment or a silicone baking mat.
Place salmon, skin side down, on the lined baking sheet. Spread evenly with honey. Sprinkle evenly with garlic. Season to taste with sea salt and pepper.
Bake salmon 7-10 minutes (longer for a thicker filet).
Turn on broiler. Place salmon under broiler 5-7 minutes or until salmon reaches desired doneness on the inside and golden on the surface.
Slide a spatula between skin and flesh to separate salmon from skin. Skin should stick to the parchment. Divide into portions and serve.', 290, 15, 'm45', 'The Easiest Honey Garlic Salmon');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (46, 5, '1 sheet frozen puff pastry sheets (defrosted, such as Pepperidge Farms)
2 teaspoons olive oil
2 garlic cloves (minced)
6 ounces fresh spinach (chopped or torn into pieces)
pepper (Sat &, to taste)
1 1/2 ounces parmesan cheese
1 ounce feta cheese crumbles', 'On a clean, dry surface sprinkle a small amount of flour to prevent sticking and lay down your sheet of defrosted puff pastry. Using a rolling pin, roll the pastry into a 10”x14” rectangle of even thickness.
In a large skillet or saute pan, bring the olive oil to medium heat. Add the garlic and allow garlic to cook for about a minute. Add the spinach and stir together. Allow the spinach to cook for 2-3 minutes, stirring occasionally until wilted. Add a couple shakes of your salt & pepper shakers (or to taste). Spread the spinach evenly across the surface of the rolled out puff pastry sheet. Sprinkle the Parmesan and Feta cheeses evenly over top of the spinach, covering the entire surface of the pastry.
With the longer side of the pastry rectangle facing you, roll the pastry by pushing forward, wrapping the ingredients into a long roll. Once the pastry is completely rolled up into a big “log,” wrap it in parchment paper or cling wrap and place it in the freezer for 30-40 minutes. This will make it easier to cut into circles.
Preheat the oven to 400 degrees. Line a large baking sheet with parchment paper and set aside.
When you take the pastry roll out of the freezer, use a serrated knife to slice it into 24 even “spirals.” I find the easiest way to do this evenly is to cut the roll in half, then each of those pieces into quarters, then cut each of those pieces into thirds. Place each spiral onto the parchment lined baking sheet and bake them in the oven for 20 minutes or until lightly golden. Serve warm.', 15, 15, 'm46', 'Cheesy Spinach Pinwheels');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (47, 5, '1/2 tablespoon olive oil
1 onions (small, diced)
6 mushrooms (large, chopped)
3/4 cup brown rice
1 3/4 cups vegetable broth (I used low sodium)
salt
pepper', 'On medium heat add oil in a small sauce pan and onions; let onions cook until translucent. Add mushrooms to the pot stirring occasionally, about 5 minutes. Stir in rice and let it cook for 3 minutes.
Stir in vegetable broth, add salt a peeper and cover with lid; reduce heat to low and let cook for 25-50 minutes or until the rice is tender.', 170, 30, 'm47', 'Mushroom Rice Pilaf');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (48, 5, '4 Italian sausage links (uncooked)
8 red potato (washed)
1 cup fresh green beans (ends cut)
olive oil
salt', 'Start by dicing your potatoes into bite-sized chunks. Create four rectangles of heavy duty foil. Fold up the sides creating a 1 inch rim. Spray your containers with cooking spray and divide the potatoes between them evenly. Top with the sausage links and green beans. You can slice the sausage beforehand or you can leave it whole. Lightly drizzle your meal with olive oil and sprinkle with seasonings. Fold up the sides to create your packet. OUTDOOR COOKING: Place your packets onto prepared coals. Cook for 30 minutes making sure to turn a few times. AT HOME COOKING: Bake at 415 degrees for 30 minutes', 290, 30, 'm48', 'Italian Sausage Tin Foil Dinner');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (49, 5, '3 whole English muffins (split)
6 slices cooked bacon (ready, not microwaved, just right out of package)
1/2 cup shredded cheddar cheese
6 large eggs
1 pinch kosher salt', 'Preheat oven to 350 degrees F.  Press english muffins carefully into bottom of  a 6 cup Texas size muffin tin.  Form a little circle with the bacon and place around inside of muffin.  Sprinkle inside with cheese then top with a whole egg in each cup, keeping inside the bacon ring.  Sprinkle with pinches of kosher salt and pepper.  Bake for 15-20 minutes or until egg is cooked through, not jiggly ??
Remove and let cool for 5 minutes before removing from muffin tin.  Serve as is or with some of your favorite hot sauce and a side of fruit', 230, 30, 'm49', 'Bacon and Cheese Egg McMuffin Cups');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (50, 5, '1 1/2 pounds broccoli florets (cut long with part of stem)
6 cloves garlic (smashed)
2 tablespoons extra-virgin olive oil
kosher salt
pepper', 'Preheat oven to 450°.
In a baking dish combine broccoli, olive oil, garlic, salt and pepper.
Roast broccoli about 20 minutes, until broccoli is browned and tender.', 126, 30, 'm50', 'Roasted Broccoli with Smashed Garlic');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (51, 5, '4 boneless skinless chicken breasts
1 cup mayonnaise (or Greek yogurt for a healthier option)
1/2 cup parmesan cheese
1 teaspoon seasoning salt
1/2 teaspoon black pepper
1 teaspoon garlic powder', 'In a small bowl, combine the mayonnaise, parmesan cheese, seasoning salt, black pepper, and garlic powder.
Spread the mixture evenly on top of the chicken breasts.
Place chicken into a baking dish and bake in preheated oven, 375 degrees, for about 45 minutes, or until cooked through.
Remove from oven and serve!', 420, 30, 'm51', 'Melt in Your Mouth Chicken');


INSERT INTO [Meal] ([idMeal], [idCategory], [ingredients], [steps], [calories], [prepTime], [mealImage], [name]) VALUES (52, 5, '6 whole russet potatoes (Medium, 6 To 8)
salt
pepper
24 whole large eggs', 'Preheat the oven to 400 degrees.
Bake the potatoes until almost tender 45 minutes to 1 hour. Allow to cool, and then peel and grate them. Season well with salt and pepper.
INCREASE OVEN TEMP TO 425 DEGREES.
Spray two muffin pans generously with cooking spray. Scoop 3 to 4 tablespoons of grated potato into each muffin cup. Use your fingers to gently press the sides and bottom in each muffin hole to make a nest. Spray again with cooking spray. Bake for 15 to 20 minutes. Watch and make sure they do not burn. Remove when the nests are golden brown.
Allow the nests to cool. Crack an egg into each one. Sprinkle with salt and pepper and bake until the whites are set, about 15 minutes.', 150, 30, 'm52', 'Eggs in Hash Brown Nests');

