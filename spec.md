# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    *Read Note*
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    *Read Note*
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Note
    This application fulfills those two requirements but it's not visible in the routes. For Users I created custom routes because I want to have consistent naming throughout the app. I also don't want to run into the potential of rails doing something unintended due to using the standard new and create routes. 
    My deck model follows standard CRUD procedures and since I have custom user routes it would be more work to get the same type of url as in the example (URL e.g. users/2/recipes). It would add more work for the same functionality in other words. 
    My app is designed around decks and the cards that belong to it. From a user experience it would be too tedious to create each card object indvidually (decks can consist of 10 different card objects) therefore, when a deck is created so are each of it's cards. There are other factors like my custom validations. My validations pass if the deck would be able to be used in an actual tournament setting, minus the intentional bad data users could submit.

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [ ] Views use partials if appropriate