var app = app || {};

app.FoodView = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.model,'change', this.render);
    this.listenTo(this.model,'delete', this.remove);
  },
  tagName: 'li',
  className: 'food',
  template: _.template('<button class="select-food"><%= name %><br/><%= cents %></button>'),

  render: function () {
    this.$el.append(this.template(this.model.attributes));
    return this;
  },
  events: {
    'click .select-food': 'selectFood'
  },
  selectFood: function () {
    $('.food-selected').removeClass('food-selected');
    this.$el.addClass('food-selected');
    app.foodSelection = this.model;
  },
});
