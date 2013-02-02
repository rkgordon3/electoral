module CandidatesHelper
	def party_select
		collection_select(:candidate, :party_id, Party.all, :id, :name)
	end

	def vote_table_tag(game, candidates)
		out =  %Q[<table class="table table-bordered" >]
		out += %Q[<thead><td>Candidate</td><td>Popular Votes</td><td>Electoral Votes</td></tr></thead>]
		candidates.each do |c|
			out += %Q[<tr><td width='35%'>#{c.name}</td><td>#{c.voting_profiles.collect { |x| x.votes }.reduce(:+)}</td>\
				        <td>#{c.electoral_votes}</td>\
				        </tr>]
		end
    	out += "</table>"
    	out.html_safe
	end

end
