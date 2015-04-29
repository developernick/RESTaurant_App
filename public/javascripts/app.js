var app = app || {};

$('document').ready(function () {


//Pulling the models + collections + views together and placing them on the page.

app.foodListPainter = new app.GeneralListView({
  modelView: app.FoodView, //Whoe to dran individual food
  collection: all.foods, // All the food
  el: $('#menu-list'), //where to render on the page
});

$('#place_order').on('click', function () {
  $.ajax({
    method: 'post',
    url: '/api/parties'
    data:{order:{party_id:??, food_id: ??} },
    success: function () {
      app.parties.fetch(); //reset the party list....
    },
  })
});



});
