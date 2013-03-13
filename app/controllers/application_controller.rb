class ApplicationController < ActionController::Base
    include GameBase
 	  protect_from_forgery

  	before_filter :set_game



  	def set_game
  	end
end
