class OrdersController < Sinatra::Base
  enable :sessions
  helpers Sinatra::SessionHelper

  # -_-_-_-_-_-_-_-_-_- Helper -_-_-_-_-_-_-_-_-_-


  # -_-_-_-_-_-_-_-_-_- Routes -_-_-_-_-_-_-_-_-_-
  # Order Routes tested all 200 ok
  get '/api/orders' do
    content_type :json
    Order.all.to_json
  end

  get '/api/orders/:id' do
    order = Order.find(params[:id].to_i)
    content_type :json
    order.to_json
  end

  post '/api/orders' do
    content_type :json
    order = Order.create(params[:order])
    order.to_json
  end

  put '/api/orders/:id' do
    order = Order.find(params[:id].to_i)
    order.update(params[:order])
    content_type :json
    order.to_json
  end

  patch '/api/orders/:id' do
    content_type :json
    order = Order.find(params[:id].to_i)
    order.update(params[:order])
    order.to_json
  end

  delete '/api/orders/:id' do
    content_type :json
    Order.delete(params[:id].to_i)
    {message: "Order has been removed"}
  end
end
