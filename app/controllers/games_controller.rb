class GamesController < ApplicationController
  include GamesHelper
  caches_action :show
  respond_to :json, :html
  # GET /games
  # GET /games.json
  def index
    @games = Game.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])
    @election = @game.election
    @game.player_in_turn = @election.active_candidates[1]
    respond_with(@game)
  end

  # GET /games/new
  # GET /games/new.json
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(params[:game])
    
    config = Configurator.new(@game.config_file, @game.start_date)
    @election = config.persist
  
   # @game.election = Election.first
    @game.election = @election
    @game.player_states= @election.active_candidates.collect { |c| 
      PlayerState.create!(player_id: c.id, game_id: @game.id, type_of: "Candidate", location: 0 ) }.select{ 
        |p| !p.nil?
    }
    @game.player_in_turn = @election.active_candidates[0]

    respond_to do |format|
      if @game.save
        @election.game = @game
        @election.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html { render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  def roll
    game = Game.find(params[:game_id])
    die = params[:die]
    roll_total = die.collect { |v| v.to_i }.sum
    mover = game.player_in_turn

    from  = game.location(mover)
   
    game.advance(mover,roll_total)
    to = game.location(mover)

    landing_date = game.election.campaign_date(to)
    landing_date_event = game.election.event_for(mover, landing_date)
    logger.info("landing date event #{landing_date_event.inspect}")
    logger.debug("die0 = #{die[0]}")
    logger.debug("die1 = #{die[1]}")
    turn = game.next_turn
    logger.debug("*******turn  #{turn}")
    game.player_in_turn = game.election.active_candidates[turn]
    game.save
    response = move_helper(game.player_in_turn.name, 
                             [{ :player=> mover.name,
                                :player_id =>  mover.id,
                                :token => mover.image,
                                :to => to,
                                :from => from,
                                :event=> (landing_date_event.id rescue -1) }])

    respond_to do |format|
      format.json { render json: response }
      format.html
    end

  end

  def reset
    expire_action :action => :show
    @game = Game.find(params[:id])
    @game.current_turn = 0
    @game.player_states.each {|p| p.location = 0 }
    @game.player_in_turn = @game.election.active_candidates[0]
    @game.save
    redirect_to game_path(@game)
  end
end
