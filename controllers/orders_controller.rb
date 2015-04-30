class OrdersController < Sinatra::Base
  enable :sessions


  # -_-_-_-_-_-_-_-_-_- Helper -_-_-_-_-_-_-_-_-_-
  def order_params
    return params[:orders] if params[:orders]
    body_data = {}
    @request_body ||= request.body.read.to_s
    body_data = (JSON(@request_body)) unless @request_body.empty?
    body_data = body_data['order'] || body_data
  end


  ##   ***** Debugging *****
  # get '/pry' do
  #   binding.pry
  # end


  # -_-_-_-_-_-_-_-_-_- Routes -_-_-_-_-_-_-_-_-_-
  # Order Routes tested all 200 ok
  get '/' do
    content_type :json
    Order.all.to_json
  end

  get '/:id' do
    order = Order.find(params[:id].to_i)
    content_type :json
    order.to_json
  end

  post '/' do
    content_type :json
    order = Order.create(params[:order])
    order.to_json
  end

  put '/:id' do
    order = Order.find(params[:id].to_i)
    order.update(params[:order])
    content_type :json
    order.to_json
  end

  patch '/:id' do
    content_type :json
    order = Order.find(params[:id].to_i)
    order.update(params[:order])
    order.to_json
  end

  delete '/:id' do
    content_type :json
    Order.delete(params[:id].to_i)
    {message: "Order has been removed"}
  end
end
