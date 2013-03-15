module CandidatesHelper
	def party_select
		collection_select(:candidate, :party_id, Party.all, :id, :name)
	end


end
