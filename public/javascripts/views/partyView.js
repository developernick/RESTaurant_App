var app = app || {}

app.partyView = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.model,'change', this.render);
    this.listentTo(this.model,'delete', this.remove);
  },
  

})
