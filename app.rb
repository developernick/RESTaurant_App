# app.rb is obsolite. make collections for all routes. move connections, gems, models to config.ru and add collection routes.

# Collections need a welcome collection to show index.erb

# build Session Collection to athenticate users that are allowed to make changes to the menu




get '/' do
  erb :index
end

get '/api/:id/reciept' do
  content_type :json
  Reciept.all.to_json
end
# -_-_-_-_-_-_-_- Checkout Routes -_-_-_-_-_-_-_-
patch '/api/:id/checkout' do
  content_type :json
  checkout = Checkout.find(params[:id].to_i)
  checkout.update(params[:checkout])
  checkout.to_json
end

put '/api/:id/checkout' do
  content_type :json
  checkout = Checkout.new(params[:checkout])
  checkout.to_json
end
