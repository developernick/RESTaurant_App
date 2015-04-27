-_-_-_-_-_-_-_-_-_- Model -_-_-_-_-_-_-_-_-_-

var FoodModel = Backbone.Model.extend();

-_-_-_-_-_-_-_-_-_- Collection -_-_-_-_-_-_-_-_-_-

var FoodCollection = Backbone.Collection.extend({
  model: FoodModel,
  url: "/api/foods"
});

var foodCollection = new FoodCollection;
foodCollection.fetch();
