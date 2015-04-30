// -_-_-_-_-_-_-_-_-_- Party Collection -_-_-_-_-_-_-_-_-_-
var app = app || {};

app.PartyCollection = Backbone.Collection.extend({
  url: "/api/parties"
});
