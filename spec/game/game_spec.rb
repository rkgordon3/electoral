require 'spec_helper'

describe 'Game' do
	before(:each) do
		@game = GameBase::Game.new
		@p0 = Candidate.new(:name=>"Gore")
		@p1 = Candidate.new(:name=>"Bush")
		@game.add_player(@p0)
    	@game.add_player(@p1)
	end

  	it 'should contain 2 players' do
    	@game.players.size.should == 2
 	end

 	it 'both players should be on square 0' do
 		@game.players_at(0) == 2
 	end

 	it 'first player should be named "Gore"' do
    	@game.player(0).name.should == "Gore"
 	end

 	it 'in_turn? should report correctly' do
 		@game.in_turn?(@p0).should == true
 		@game.in_turn?(@game.player(0)).should == true
 		@game.player(0).name.should == @p0.name

 	end

 	it 'player_in_turn should report correctly' do
 		@game.player_in_turn.should == @p0
 	end

 	it 'next_turn update current player in turn' do
 		@game.next_turn
 		@game.player_in_turn.name.should == @p1.name

 	end

 	it 'next_turn rolls over correctly based on no. of players' do
 		@game.next_turn
 		@game.next_turn
 		@game.player_in_turn.name.should == @p0.name
 	end

 	it 'player should be at square 5' do
 		@game.move(@p0, 5)
 		@game.player(@p0).location.should == 5
 	end


end
