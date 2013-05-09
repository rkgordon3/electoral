module ApplicationHelper
	include ActionView::Helpers::JavaScriptHelper
	def roll_tag(game, options = {})
		param_hash = options.reverse_merge({ :controller => "games", :action => "roll" })
		out = ""

		out += javascript_tag (%Q[
			function update_die(id, val) {
			  $(id).html("<img src='/assets/die"+val+".gif' alt='" + val +"' >");
			}
			function update_player(id, val) {
				$(id).html("<img src='/assets/"+val.toLowerCase()+".jpeg' width='64' height='64' alt='" + val +"' >");
			}
			function roll(elem) {
				val0 = Math.floor((Math.random()*6)+1);
				update_die("#die0_label", val0)
  				val1 = Math.floor((Math.random()*6)+1);
  				update_die("#die1_label",val1);
  				$.post("/#{param_hash[:controller]}/#{game.id}/#{param_hash[:action]}", 
  				       { 'die[]' : [val0, val1] }, 
  				       function(data) { 
                  			update_player('#player_in_turn', data.player_in_turn);
                  			handle_move(data); 
                  		}, 
                  		"json");
			};
		])
        player_img = image_tag("#{game.player_in_turn.name}.jpeg".downcase, :size=>"64x64")
        # This code purely for initialization. Javascript above takes care 
        # of subsequent rolls
        r = Random.new(Time.new.to_i)
		val0 = r.rand(6)+1
		val1 = r.rand(6)+1
		die0_img = die_image_tag(val0)
        die1_img = die_image_tag(val1)
		out += %Q[<table class='table table-bordered table-condensed'>\
			<tr><td style='vertical-align:middle;' id='player_in_turn'>#{player_img}</td><td style='vertical-align:middle;'><i class='icon-retweet' onclick="roll(this);"></i><td style='vertical-align:middle;' id='die0_label' >#{die0_img}</td><td style='vertical-align:middle;' id='die1_label' >#{die1_img}</td></tr></table>]

		out.html_safe
	end

	def die_image_tag(val) 
		image_tag("die#{val}.gif", alt: val)
	end

end
