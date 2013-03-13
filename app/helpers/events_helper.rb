module EventsHelper
	def location_select
		collection_select(:event, :location_id, State.all, :id, :name)
	end

	def json_events(events)
		setup = {}
		events_array = []
		events.each do |e| 
			outcomes = []
=begin
			e.outcomes.each { |o| 
				outcomes << { :candidate => o.candidate.name, :delta => o.delta }
			}
=end 
			events_array << { :name => e.name, 
				              :month => e.date.month, 
				              :date => e.date.day, 
				              :type => "debate",
				              :year => e.date.year, 
				              :description => e.description,
				              :outcomes => outcomes  }
		end
		setup[:events] = events_array
		setup.to_json.html_safe
	end
end
