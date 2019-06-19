# Arnie's Bistro


## Summary
Your friend Arnie, the owner of Arnie's Bistro, a popular restaurant.

Arnie hired a programmer to build a computerized recipe system for the restaurant, but the programmer didn't finish the job before moving on to "an exciting opportunity" Arnie needs someone to finish the restaurant's recipe system, and that person is you.

Arnie would like a working program as soon as possible.  Complete the program to accomplish the use cases detailed below. Be wary of over-designing the program — your only job is to solve *these* problems, not to find other problems to solve.


### Recipe System Use Cases
![required use cases](readme-assets/required-animation.gif)  
*Figure 1*. Example usage, listing all recipes and displaying a specific recipe.

The recipe system should support two uses:  (1) users should be able to list all the recipes in the system and (2) users should be able to display the details for a specific recipe.  Figure 1 displays both of these uses and how Arnie would like to run the application.


### Part 0:  Review the Code Base
As mentioned in the *Summary*, the previous developer left some code.  Review the provided code.  Don't assume that the previous developer made good design choices or that the code works.  How was the developer approaching the problem?  Does this approach make sense?  Are there things you would do differently?  Are there things you would keep?


### Part 1: Implement the Minimum Viable Product
Building on the provided code base, implement the use cases described in the *Summary* and shown in Figure 1.  Remember, Arnie wants a working application soon, so we need to focus on just these features.

To recap how the program works, when users want to list all recipes, the program should display something like Figure 2.  When users want to see the details for a particular recipe, the program should display something like Figure 3 ... unless no recipe with the given id exists, then an error should be raised (see Figure 1).

```
$ ruby recipe_system.rb list
567 - Peanut Butter Coffee Brownie
938 - Bull Terrier Cake (for a puppy)
111 - Kale Burger
```
*Figure 2*.  Listing all the recipes.

```
$ ruby recipe_system.rb display 111
Recipe 111 - Kale Burger
Combining the taste of cow with the nutrition of kale!

Ingredients:
Kale, Cow

Preparation Instructions:
Preheat oven to 500 degrees, put in a cow. Wait 10 minutes. Put in some kale. Take out cow and kale. Put on bun. Serve HOT!
```
*Figure 3*.  Displaying a specific recipe.

*Note:*  Your top priority is to create a functioning recipe system.  There are a couple of tests in the spec files which should be completed. You're welcome to write more tests if you desire, but you are *not required* to do so. You have a limited amount of time; be mindful of how you spend it.  Tests alone cannot demonstrate your learning from the last two weeks.  Focus on implementation.


### Part 2:  Recipes in Alphabetical Order
Currently, the recipe system lists recipes in whichever order they happen to be.  Arnie would like to see the recipes listed alphabetically by name.  (See Figure 4.)

![part two animation](readme-assets/part-two-animation.gif)  
*Figure 4*.  Listing recipes in alphabetical order by name.

