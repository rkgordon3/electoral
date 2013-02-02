class ApplicationController < ActionController::Base
    include GameBase
 	  protect_from_forgery

  	before_filter :set_game

  	def set_game
  		begin
  			game = GameBase::Game.new
  			game.add_player(Candidate.find_by_name("Gore"))
    		game.add_player(Candidate.find_by_name("Bush"))
    		session[:game] = game
        logger.debug("%%%%%%%%%%% app controller #{game.inspect}")
        session[:game_session] = GameSession.new(game)
		  end if session[:game].nil?
  	end
end
