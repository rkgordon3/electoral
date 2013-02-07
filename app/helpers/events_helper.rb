module EventsHelper
	def location_select
		collection_select(:event, :location_id, State.all, :id, :name)
	end

	def json_events
		setup = {}
		events_array = []
		Event.all.each do |e| 
			outcomes = []
			e.outcomes.each { |o| 
				outcomes << { :candidate => o.candidate.name, :delta => o.delta }
			}
			events_array << { :name => e.name, 
				              :month => e.date.month, 
				              :date => e.date.day, 
				              :year => e.date.year, 
				              :type => e.event_type,
				              :description => e.description,
				              :outcomes => outcomes  }
		end
		setup[:events] = events_array
		setup.to_json.html_safe
	end
end
