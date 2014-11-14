require 'sinatra/base'
require './lib/player'



class BattleShips < Sinatra::Base
	set :views, Proc.new{File.join(root,'..','views')}

	enable :sessions
  
  get '/' do
    # 'Hello BattleShips'
    puts session.inspect
    erb :index
  end

  #post '/' do 

  get '/new_game' do
  	puts session.inspect 
  	erb :player_reg
  end

  post '/welcome' do 
  	@player = Player.new(params[:name])
  	@name = @player.name 
  	session[:player_1] = @player
  	puts session 
  	erb :welcome
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
