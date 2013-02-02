class GameSessionsController < ApplicationController
  def roll
  	game = session[:game]
  	die = params[:die]
  	logger.debug("die0 = #{die[0]}")
  	logger.debug("die1 = #{die[1]}")
  	game.next_turn

  	respond_to do |format|
  		format.json { render json: game.player_in_turn }
  		format.html
  	end

  end
end
