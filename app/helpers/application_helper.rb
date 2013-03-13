module ApplicationHelper
	include ActionView::Helpers::JavaScriptHelper
	def roll_tag(game, options = {})
		param_hash = options.reverse_merge({ :controller => "games", :action => "roll" })
		out = ""
		out += javascript_tag (%Q[function roll(elem) {
			val0 = Math.floor((Math.random()*6)+1);
			$("#die0_label").html(val0);
  			val1 = Math.floor((Math.random()*6)+1);
  			$("#die1_label").html(val1);
  			$.post("/#{param_hash[:controller]}/#{game.id}/#{param_hash[:action]}", 
  				       { 'die[]' : [val0, val1] }, 
  				       function(data) { 
                  $("#player_in_turn").html(data.player_in_turn);
                  handle_move(data); }, "json");
		};])
         		
		out += %Q[<table class='table table-bordered table-condensed'>\
			<tr><td id='player_in_turn'>#{game.player_in_turn.name}</td><td><i class='icon-retweet' onclick="roll(this);"></i><td id='die0_label'>1</td><td id='die1_label' >3</td></tr></table>]

		out.html_safe
	end

end
