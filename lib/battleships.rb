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
  	erb :player_reg
  end

  get '/welcome' do 
  	@player = params[:name]
  	erb :welcome
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
