require 'spec_helper'

describe ElectoralGame do
	before(:each) do
		@start_date = Date.new(2008, 9, 1)
		@game = ElectoralGame.new(@start_date)
		@p0 = Candidate.new(:name=>"Gore")
		@p1 = Candidate.new(:name=>"Bush")
		@game.add_player(@p0)
		@game.add_player(@p1)
	end

	it 'should move campaign date' do
		@game.advance_campaign(@p0, 5)
		@game.campaign_date(@p0).should == @start_date + 5
	end

	it 'should place player at campaign start' do
		@game.campaign_date(@p0).should == @start_date
	end

	it 'should generate proper tag for start date' do
		@game.to_tag(@start_date).should == "c3d_9_1_2008"
	end

        it 'should report  proper election year' do
        	@game.election_year.should == 2008
	end

	it 'should report proper campaign start date' do
 		@game.campaign_start_date.should == 1
	end 
	it 'should report proper campaign start month' do
 		@game.campaign_start_month.should == 9
	end 

        it 'should report proper no. of days on campaign' do
            @game.advance_campaign(@p0, 4)
	    @game.days_on_campaign(@p0).should == 4
	end	
        it 'should report 0 no. of days at start' do
	    @game.days_on_campaign(@p0).should == 0
	end	

end
