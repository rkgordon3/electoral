require 'event_descriptor.rb'
module Events

	%w(election event policy).each { |m| 
  		define_method(m.to_sym) { |caption| Object::const_get("#{m.capitalize}Descriptor").new(caption) }
	}
end