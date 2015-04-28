var app = app || {}

app.partyView = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.model,'change', this.render);
    this.listentTo(this.model,'delete', this.remove);
  },
  tagName:'li',
  className:'party',
  template: _.template('<%= table_number %><button class="select-party">Select</button>'),

  render: function () {
    this.$el.append(this.template(this.model.attributes));
    this.renderFoodList();
    return this;
  }, //--render end

  renderFoodList: function () {
    var foods = this.model.get('foods');
    var foodList = ('<ul>');
    for (var i = 0; i < foods.length; i++) {
      foodList.append($('<li>').text(foods[i]['name']));
    }
    this.$el.append(foodList);
  }, //--renderFoodList end

  events: {
    'click .select-party': 'selectParty'
  },

  selectParty: function () {
    $('.party-selected')removeClass('party-selected');
    this.$el.addClass('party-selected');
    app.partySelection = this.model;
  }
  
});
