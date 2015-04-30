var app = app || {}

app.partyView = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.model,'change', this.render);
    this.listenTo(this.model,'delete', this.remove);
  },
  tagName:'li',
  className:'party',
  template: _.template('<button class="select-party">Select Table<br/><%= table_number %></button>'),

  render: function () {
    this.$el.append(this.template(this.model.attributes));
    this.renderFoodList();
    return this;
  }, //--render end

  renderFoodList: function () {
    if (this.model.get("foods")) {
      var foods = this.model.get('foods');
      var foodList = ('<ul>');
      for (var i = 0; i < foods.length; i++) {
        foodList.append($('<li>').text(foods[i]['name']));
      }
      this.$el.append(foodList);
    }

  }, //--renderFoodList end

  events: {
    'click .select-party': 'selectParty'
  },

  selectParty: function () {
    $('.party-selected').removeClass('party-selected');
    this.$el.addClass('party-selected');
    app.partySelection = this.model;
  }

});
