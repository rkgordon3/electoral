module GamesHelper

	def json_electoral_votes(game)
	    votes = {}
	    State.all.each { |s|   votes[s.state_tag] = s.electoral_votes.to_s }
	    votes.to_json.html_safe
	end
	def json_voting_profiles(game)
		profiles = {}
		State.all.each  do  |s| 
			profiles[s.state_tag] = []
			s.voting_profiles.sort.reverse.each do  |vp| 
				profiles[s.state_tag] << { :name => vp.candidate.name, :votes => vp.votes }
			end
		end
		profiles.to_json.html_safe
	end
# TODO de-couple from specific candidates
	def json_percent_differential(game)
		percent_diff_map = {}
		gore = Candidate.find_by_name("Gore")
		bush = Candidate.find_by_name("Bush")
		percent_diff_map['red_states'] = State.margin_map(bush)
		percent_diff_map['blue_states'] = State.margin_map(gore)

		percent_diff_map.to_json.html_safe
	end
end
