class GameSessionsController < ApplicationController
  def players
    game = session[:game]
    render json: game.players
  end

  def roll
  	game = session[:game]
  	die = params[:die]
    roll_total = die.collect { |v| v.to_i }.sum
  	player = game.player_in_turn
    date = game.campaign_date(player)
    old_ndays  = game.days_on_campaign(player)
   
  	game.advance_campaign(player,roll_total)
    new_ndays = game.days_on_campaign(player)

  	logger.debug("die0 = #{die[0]}")
  	logger.debug("die1 = #{die[1]}")
  	game.next_turn

    response = {  :player_in_turn => game.player_in_turn.name, 
                  :moves => [ { :player=> player.name, 
                                :token => player.image,
                                :to => new_ndays,
                                :from => old_ndays}]
               }

  	respond_to do |format|
  		format.json { render json: response }
  		format.html
  	end

  end

  def reset
    session[:game] = nil
    #redirect_to maps_show_path
    render :nothing => true
  end

  def new
    session[:game] = nil
    game = set_game
    state = {}
    state[:player_in_turn] = game.player_in_turn.name
    moves = []
    game.players.each { |p| 
      moves << { :player=> p.name, :token => p.image, :to=> game.days_on_campaign(p) }
    }
    state[:moves] = moves
    render json: state.to_json
  end
end
