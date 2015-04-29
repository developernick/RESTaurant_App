var app = app || {}


app.PartyView = Backbone.view.extend({

  initialize: function () {
    this.listenTo(this.model, 'change', this.render)
  },

  template: _.template('<p><%= table_number %></p>'),

  render: function () {
    var data - this.model.attributes;
    var renderHTML = this.template( data );
    this.$el.html( renderHTML );

    var foods = this.model.get('foods');//assume 'foods' was included in the parties
    var foodList= $('<ul>');
    for (var i = 0; i < foods.length; i++) {
      var foodItem = foods[i];
      var newLi = $('<li>').html(foodItem.name);
      foodList.append(newLi);
    }
  },
  <li class= 'party'>
    <p>
      3
    </p>
    <ul>
      <li>foodName</li>
      <li>foodName</li>
      <li>foodName</li>
    </ul>
  </li>
})

// -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

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
