
require 'spec_helper'

describe Candidate do
	before(:all) {
		config = Configurator.new("test3", "11/2/2008")
    	@election = config.persist
    	@bush = Candidate.find_by_name("Bush")
    	@gore = Candidate.find_by_name("Gore")

	}

	it 'should report profile' do 
		s = State.find_by_abbrev("IL")
		d = Demographic.create!(type_of: "State", value_id: s.id)
		vp = @bush.profile_for(d)
		State.find(vp.state_id).abbrev.should == "IL"
	end

	
end