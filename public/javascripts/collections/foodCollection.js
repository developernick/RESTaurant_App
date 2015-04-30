// -_-_-_-_-_-_-_-_-_- Food Collection -_-_-_-_-_-_-_-_-_-
var app = app || {};

app.FoodCollection = Backbone.Collection.extend({
  url: "/api/foods"
});
