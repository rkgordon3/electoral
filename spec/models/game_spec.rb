# == Schema Information
#
# Table name: games
#
#  id           :integer         not null, primary key
#  election_id  :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  config_file  :string(255)
#  start_date   :date
#  candidate_id :integer
#  current_turn :integer         default(0)
#  max_position :integer
#

require 'spec_helper'

describe Game do
  before(:all) {
    @game = Game.new
    config = Configurator.new("test3",Date.today)
    @election = config.persist
    @game.setup(@election)
   
  }
  it 'should have two players' do 
  	@game.player_states.size.should == 2
  end

  it 'should have all players at location 0' do
  	@game.player_states[0].location.should == 0
  	@game.player_states[1].location.should == 0  	
  end

  it 'should have a player in turn' do 
    assert @game.player_in_turn
  end

  it  'should take turns' do 
  	pit = @game.player_in_turn
  	@game.next_turn
  	@game.player_in_turn.should_not == pit
  	pit = @game.player_in_turn
  	@game.next_turn
  	@game.player_in_turn.should_not == pit
  end

  it 'should advance player 5' do 
  	p = @game.player_in_turn
  	loc = @game.location(p)
  	@game.advance(p, 5)
  	@game.location(p).should == loc + 5
  end

  it 'should report game over' do 
  	@game.max_position = 1
  	@game.save
  	p = @game.player_in_turn
  	loc = @game.location(p)
  	@game.advance(p, 5)
  	@game.next_turn
  	p = @game.player_in_turn
  	loc = @game.location(p)
  	@game.advance(p, 5)
  	@game.over?.should == true
  end


end
