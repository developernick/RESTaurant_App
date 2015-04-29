class PartiesController < Sinatra::Base
  enable :sessions
  helper Sinatra::SessionHelper

  # -_-_-_-_-_-_-_-_-_- Helper -_-_-_-_-_-_-_-_-_-
  def party_params
    return params[:party] if params [:party]
    body_data = {}
    @request_body ||= request.body.read.to_s
    body_data = (JSON(@request_body)) unless @request_body.empty?
    body_data = body_data['parties'] || body_data
  end


  ##   ***** Debugging *****
  # get '/pry' do
  #   binding.pry
  # end

  # -_-_-_-_-_-_-_-_-_- Routes -_-_-_-_-_-_-_-_-_-
  # Tested party routes all 200 ok
  get '/api/parties' do
    content_type :json
    Party.all.to_json
  end

  get '/api/parties/:id' do
    party = Party.find(params[:id].to_i)
    content_type :json
    party.to_json
  end

  post '/api/parties' do
    party = Party.create(params[:party])
    content_type :json
    party.to_json
  end

  patch '/api/parties/:id' do
    party = Party.find(params[:id].to_i)
    party.update(params[:party])
    content_type :json
    party.to_json
  end

  put '/api/parties/:id' do
    party = Party.find(params[:id].to_i)
    party.update(params[:party])
    content_type :json
    party.to_json
  end

  delete '/api/parties/:id' do
    content_type :json
    Party.delete(params[:id].to_i)
    {message: "Party has been removed."}.to_json
  end


end # PartiesController end
