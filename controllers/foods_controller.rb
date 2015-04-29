class FoodsController < Sinatra::Base
  enable :sessions
  helper Sinatra::SessionHelper

  # -_-_-_-_-_-_-_-_-_- Helper -_-_-_-_-_-_-_-_-_-
  def food_params
    return params[:food] if params[:food]
    body_data = {}
    @request_body ||= request.body.read.to_s
    body_data = (JSON(@request_body))unless @request_body.empty?
    body_data = body_data[:food] || body_data
  end

  ##   ***** Debugging *****
  # get '/pry' do
  #   binding.pry
  # end

  
  # -_-_-_-_-_-_-_-_-_- Routes -_-_-_-_-_-_-_-_-_-
    # Tested food routes all 200 ok
  get '/api/foods' do
    content_type :json
    Food.all.to_json
  end

  get '/api/foods/:id' do
    food = Food.find(params[:id].to_i)
    content_type :json
    food.to_json
  end

  post '/api/foods' do
    food = Food.create(params[:food])
    content_type :json
    food.to_json
  end

  patch '/api/foods/:id' do
    food = Food.find(params[:id].to_i)
    food.update(params[:food])
    content_type :json
    food.to_json
  end

  put '/api/foods/:id' do
    food = Food.find(params[:id].to_i)
    food.update(params[:food])
    content_type :json
    food.to_json
  end

  delete '/api/foods/:id' do
    Food.delete(params[:id].to_i)
    content_type :json
    {message: "Food item has been removed."}.to_json
  end
end
