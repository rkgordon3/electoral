require 'spec_helper'

describe Board do
	@mdboard = nil
  @onedimboard = nil
	before(:each) do
		class Foo
  		  include Board
  		end
  		@mdboard = Foo.new
  		@mdboard.set_squares(5,5)
      @onedimboard = Foo.new
      @onedimboard.set_squares(100)
  	end

    it 'should be 5x5' do
      @mdboard.dim.should == [5,5]
    end

    it 'should remove player from 1,1' do
      c = Candidate.new(:name=>"Bob")
      @mdboard.place(c, 1,1)
      @mdboard.remove(c).should == [1,1]
      @mdboard.players_at(1,1).length.should == 0

    end

  	it 'should place player at 0 square' do

  		@mdboard.place(Candidate.new(:name=>"Bob"))
  		@mdboard.players_at(0).collect { |p| p.name }.should include "Bob"
  		@mdboard.players_at(0).length.should == 1
  	end

  	it 'should place player at 3,4' do
  		@mdboard.place(Candidate.new(:name=>"Bob"), 3, 4)
  		@mdboard.players_at(3,4).collect { |p| p.name }.should include "Bob"
  		@mdboard.players_at(3,4).length.should == 1
  	end

  	it 'should contain two players' do
  		@mdboard.place(Candidate.new(:name=>"Bob"), 3, 4)
  		@mdboard.place(Candidate.new(:name=>"Bill"), 3, 4)
  		@mdboard.players_at(3,4).collect { |p| p.name }.should include "Bob"
  		@mdboard.players_at(3,4).collect { |p| p.name }.should include "Bill"
  		@mdboard.players_at(3,4).length.should == 2
  	end

    it 'player location should be 2,2' do
      player = Candidate.new(:name=>"Bill")
      @mdboard.place(player, 2,2)
      @mdboard.location(player).should == [2,2]
    end


    it 'should contain 1 column' do
      @onedimboard.dim.should == [100, 1]
    end

    it 'should be at start' do
       player = Candidate.new(:name=>"Bill")
       @onedimboard.place(player, 0)
       @onedimboard.location(player).should == [0, 0]
    end

     it 'should be at square 2' do
       player = Candidate.new(:name=>"Bill")
       @onedimboard.place(player, 2)
       @onedimboard.location(player).should == [2, 0]
    end

end

  
