
require 'spec_helper'
require 'events.rb'
require 'states.rb'
include States

describe 'Test3 Events' do
	before(:all) {
    	config = Configurator.new("test3", Date.new(2008, 11, 3))
    	config.persist
    	@election = Election.find_by_name("test3")
    	@gore =@election.candidate_for("Gore")
    	@bush = @election.candidate_for("Bush")
  	}

  it "should report an event for Gore on day 4" do
     event = @election.event_for(
     	  		@election.candidate_for("Gore"), 
     	        @election.campaign_date(4))
    assert event   
    event.name.should == "Gore Supports Teachers' Unions"
  end

  it "should report an event for Bush on day 4" do
     event = @election.event_for(
            @election.candidate_for("Bush"), 
              @election.campaign_date(4))
    assert event
    event.name.should == "Bush Supports Big Tabacco"
  end

  it "should report an event for both on day 8" do
    event = @election.event_for(
            @election.candidate_for("Bush"), 
              @election.campaign_date(8))
    assert event
    event.name.should == "Event triggered by both"
    event = @election.event_for(
            @election.candidate_for("Gore"), 
              @election.campaign_date(8))
    assert event
    event.name.should == "Event triggered by both"
  end

  it 'should properly update +1 [WI, AR, TN] for Bush' do 
    event = @election.event_for(
            @election.candidate_for("Bush"), 
              @election.campaign_date(8))
    wi_demo = Demographic.create!(type_of: "State", value_id: State.find_by_abbrev("WI").id)
    ar_demo = Demographic.create!(type_of: "State", value_id: State.find_by_abbrev("AR").id)
    tn_demo = Demographic.create!(type_of: "State", value_id: State.find_by_abbrev("TN").id)

    wi_profile = @bush.profile_for(wi_demo)
    ar_profile = @bush.profile_for(ar_demo)
    tn_profile = @bush.profile_for(tn_demo)


    wi_before_votes = wi_profile.votes 
    ar_before_votes = ar_profile.votes 
    tn_before_votes = tn_profile.votes 

    puts "@@@@@ before #{[wi_before_votes, ar_before_votes, tn_before_votes]}"

    event.apply_outcomes(@bush)

    @bush.profile_for(wi_demo).votes.to_i.should == wi_before_votes + (wi_before_votes * 0.01)
    @bush.profile_for(ar_demo).votes.to_i.should == ar_before_votes + (ar_before_votes * 0.01)
    @bush.profile_for(tn_demo).votes.to_i.should == tn_before_votes + (tn_before_votes * 0.01)

  end

  it 'should properly update +1 [WI, AR, TN] for Bush and Gore' do 
    event = Event.find_by_election_id_and_name(@election.id, "Outcomes applied to both")
    wi_demo = Demographic.create!(type_of: "State", value_id: State.find_by_abbrev("WI").id)
    ar_demo = Demographic.create!(type_of: "State", value_id: State.find_by_abbrev("AR").id)
    tn_demo = Demographic.create!(type_of: "State", value_id: State.find_by_abbrev("TN").id)

    wi_profile = @bush.profile_for(wi_demo)
    ar_profile = @bush.profile_for(ar_demo)
    tn_profile = @bush.profile_for(tn_demo)

    g_wi_profile = @gore.profile_for(wi_demo)
    g_ar_profile = @gore.profile_for(ar_demo)
    g_tn_profile = @gore.profile_for(tn_demo)


    wi_before_votes = wi_profile.votes 
    ar_before_votes = ar_profile.votes 
    tn_before_votes = tn_profile.votes 

    g_wi_before_votes = g_wi_profile.votes 
    g_ar_before_votes = g_ar_profile.votes 
    g_tn_before_votes = g_tn_profile.votes 

    puts "@@@@@ bush before #{[wi_before_votes, ar_before_votes, tn_before_votes]}"
    puts "@@@@@ gore before #{[g_wi_before_votes, g_ar_before_votes, g_tn_before_votes]}"

    event.apply_outcomes

    @bush.profile_for(wi_demo).votes.to_i.should == wi_before_votes + (wi_before_votes * 0.01)
    @bush.profile_for(ar_demo).votes.to_i.should == ar_before_votes + (ar_before_votes * 0.01)
    @bush.profile_for(tn_demo).votes.to_i.should == tn_before_votes + (tn_before_votes * 0.01)

    @gore.profile_for(wi_demo).votes.to_i.should == g_wi_before_votes + (g_wi_before_votes * 0.01)
    @gore.profile_for(ar_demo).votes.to_i.should == g_ar_before_votes + (g_ar_before_votes * 0.01)
    @gore.profile_for(tn_demo).votes.to_i.should == g_tn_before_votes + (g_tn_before_votes * 0.01)

  end
	
end