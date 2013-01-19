class MapsController < ApplicationController
  def show
  	@al = "US-AL"
  	 respond_to do |format|
  	 	format.html
  	 	format.json
  	 end
  end
end
