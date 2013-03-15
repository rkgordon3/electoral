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

	#
	# Generate HTML id attribute value of a calendar day
	#
	def id_tag_for(event) 
    	"c3d_#{event.date.month}_#{event.date.day}_#{event.date.year}"
  	end
=begin
	
Bush:+1<br/>Gore:-1<br/>
            			#{button_tag(\'Ok\', ,
            				
            				

       	content: function() { return \"<span>#{event.description}</span><br/>\" }

       	content:  function(){ return "<span>#{event.description}</span><br/><button  onclick='close_popover(this);' class='addf'>ok</button>"; }    
=end
	#
	# Generate a bootstrap popover for an event
	#
	# Use form helper to generate button tag to avoid having to think too
	# much about quotes.
	# If you generate button as such and simply #{} eval below, life
	# is much easier.
	#
	# First jquery invocation generates popover. Second one simpply add a class 
	# to calendar day to reflect the type of event that occurs on that day, ie.
	# events of color-coded.
	#
  	def popover(event)

  		button = button_tag("Ok", 
  			       :id=> "#{id_tag_for(event)}b",
  			       :class=>'btn btn-success btn-mini',
  			       :onclick=>"$('##{id_tag_for(event)}').popover('hide');"
  			       ).gsub(/'/, "&quot;").gsub(/"/, "'")
  		%Q[
  	    $('##{id_tag_for(event)}').popover(
  	    		{ 	html:true,
        			placement:'bottom',
        			trigger: 'click',
        			title: '#{event.name}',
        			content:  function(){ 
        				return "<span>#{event.description}</span><br/>#{button}";
        			}
				}
        );

    	$('##{id_tag_for(event)}').addClass('#{event.event_type}');
    	].html_safe
    end
end
