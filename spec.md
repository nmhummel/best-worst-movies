# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
        - Movie has_many Rankings, User has_many Rankings and has_many Ranked_Movies through Rankings
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
        - Movie belongs to user, Ranking belongs_to User and Movie.
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
        - User has many Movies through Rankings; Movie has many users through Rankings.
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
        - Movie has_many Users through Ranking, and vice-versa
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
        - All models have several attributes, and ranking has a movie_id and user_id
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
        - User, Ranking, Movie all have validations
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
        - Ranking class has several scope methods; Movie has two
- [x] Include signup (how e.g. Devise) = new User method and view page
- [x] Include login (how e.g. Devise) = new Session method and view page
- [x] Include logout (how e.g. Devise) = defined route and button for logout
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) = Google OAuth has been utilized
- [X] Include nested resource show or index (URL e.g. users/2/recipes) = I have nested routes, but their show and index pages are nested in their parent view files, so the methods to define the routes are not active. Ex. My movie show page has the ranking's _index and _show page on it, so you can see the movie's info, its ranking averages, and ALL rankings
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) = movies/57/rankings/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new) = rescue/not_found.html.erb

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
