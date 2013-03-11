class ApplicationController < ActionController::Base
    include GameBase
 	  protect_from_forgery

  	before_filter :set_game



  	def set_game
      parties = ["Republican", "Democratic"]
  		begin
  			game = ElectoralGame.new("pres2008")
        i = 0
        game.configuration.candidates.each { |c|
          game.add_player(Candidate.new(name: c, party_id: Party.find_by_name(parties[i % 2]).id))
          i += 1
        }
    		session[:game] = game
		  end if session[:game].nil?
      session[:game]
  	end
end
