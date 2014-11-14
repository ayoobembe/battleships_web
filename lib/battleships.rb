require 'sinatra/base'
require './lib/player'
require './lib/game'

class BattleShips < Sinatra::Base

	set :views, Proc.new{File.join(root,'..','views')}
	enable :sessions
  GAME = Game.new 


  get '/' do
    p GAME
    session[:game] = GAME
    @player1 = GAME.player1
    @player2 = GAME.player2
    @count = GAME.count
    puts @count
    puts session.inspect
    p '==' * 20
    erb :index
  end

  post '/new_game' do 
  	player = Player.new(params[:player_name])
  	GAME.add_player(player)
  	session[:me] = player.object_id
  	puts session.inspect
  	redirect to '/'
  end

  get '/new_game' do
  	puts session.inspect 
  	erb :player_reg
  end

  get '/welcome' do 
  	@player = Player.new(params[:name])
  	@name = @player.name 
  	session[:player_1] = @player
  	puts session 
  	erb :welcome
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
