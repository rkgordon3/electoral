class MapsController < ApplicationController
  def show
  	logger.debug("++++++++++++session[:game] = #{session[:game]}")
  	logger.debug("+++ game #{session[:game].inspect}")
  	logger.debug("+++ game #{File.expand_path(session[:game].to_s)}")
  	#logger.debug("+++ load path #{$LOAD_PATH}")
  	 respond_to do |format|
  	 	format.html
  	 	format.json
  	 end
  end
end
