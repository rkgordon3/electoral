class MapsController < ApplicationController
  def show
  	 respond_to do |format|
  	 	format.html
  	 	format.json
  	 end
  end
end
