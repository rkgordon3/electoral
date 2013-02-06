class MapsController < ApplicationController
  def show
     @game = session[:game_session]
  	 respond_to do |format|
  	 	format.html
  	 	format.json
  	 end
  end
end
