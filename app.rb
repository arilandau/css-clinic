require "sinatra"
require_relative "models/player"
require_relative "models/team"
require_relative "models/team_data"
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces

get "/" do
  redirect '/teams'
end

get '/teams' do
  @teams = TeamData::ROLL_CALL
  erb :index
end

get '/teams/:team_name' do
  @teams = TeamData::ROLL_CALL
  @teams.each do |team, players|
    if team == params[:team_name].to_sym
      @team = team
      @players = players
    end
  end
  erb :team
end
