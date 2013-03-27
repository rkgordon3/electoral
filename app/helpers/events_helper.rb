module EventsHelper
	include Rails.application.routes.url_helpers 
	require 'string.rb'
  include 
	def location_select
		collection_select(:event, :location_id, State.all, :id, :name)
	end

	#
	# Generate HTML id attribute value of a calendar day
	#
	def id_tag_for(date) 
    	"c3d_#{date.month}_#{date.day}_#{date.year}"
  end

  def response_form(candidate, event)
    class_map = { yes: "success", no: "danger", ok: "success"}
    triggers = event.outcomes_for(candidate).collect { |o| o.trigger }.uniq
    triggers = ["Ok"] if triggers.empty?
    form_tag(event_outcome_path, :remote=>true) do  	
      [ hidden_field_tag('candidate_id', candidate.id),
        hidden_field_tag('event_id', event.id),
        triggers.each.collect { |trigger| 
          trigger_display = trigger || "Ok"
        	button_tag(trigger_display, 
                       :class=>"btn btn-#{class_map[trigger_display.downcase.to_sym]} btn-mini",
                       :value=> trigger) 
        }.join("")
      ].join("<br/>").html_safe
    end
  end

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
	def popover_tag(candidate, event, active = false)
		buttons = button_tag("Ok", 
			       :id=> "#{id_tag_for(event.date)}b",
			       :class=>'btn btn-success btn-mini',
			       :onclick=>"$('##{id_tag_for(event.date)}').popover('hide');$.get('#{outcome_path(event, "ok")}', { }, 'js');"
			       ).gsub(/'/, "&quot;").gsub(/"/, "'")
		outcome_form = response_form(candidate, event).gsub(/'/, "&quot;").gsub(/"/, "'")
        activate = active ?  %Q[$('##{id_tag_for(event.date)}').popover('show');] : ""
        description = ""

        while  (ln = event.description.next_phrase(30)) do
        	puts "Adding #{ln}"
        	description = description + ln+"<br/>"
        end
        
		%Q[
	    	$('##{id_tag_for(event.date)}').popover(
	    		{ 	html:true,
      			placement:'bottom',
      			trigger: 'click',
      			title: '#{event.name}',
      			content:  function(){ 
      				return "<span>#{description}</span><br/>#{outcome_form}";
      			}
			}
      	);
    	#{activate}
  
  		].html_safe
  end
end
