class ApplicationController < ActionController::Base
    include GameBase
 	  protect_from_forgery

  	before_filter :set_game

  	def set_game
  		begin
  			game = ElectoralGame.new(Date.new(2008, 9, 1))
  			game.add_player(Candidate.find_by_name("Gore"))
    		game.add_player(Candidate.find_by_name("Bush"))
    		session[:game] = game
		  end if session[:game].nil?
      session[:game]
  	end
end
