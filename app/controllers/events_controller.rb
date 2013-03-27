class EventsController < ApplicationController
  respond_to :js, :json, :html
  # GET /events
  # GET /events.json
  def index
    @election = Election.find(params[:election_id])
    @events = @election.events
    respond_with(@election, @events)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json`
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  #
  # Process response, apply outcome
  def outcome
    logger.info("apply outcomes candidate #{params[:candidate_id]} responds #{params[:button]} for event #{params[:event_id]}")
    @event = Event.find(params[:event_id])
    # Ignore triggering candidate when applying outcomes unless a policy event
    @candidate = @event.event_type == 'policy' ? Candidate.find(params[:candidate_id]) : nil 
    # vote_table in response needs @election
    @election = Election.find(@event.election_id) 
    @event.apply_outcomes(@candidate, (params[:button] unless params[:button].blank?))
  end

  #
  # Activate an event for a candidate
  #
  def activate
    logger.info("activate for #{params[:candidate_id]} on #{params[:event_id]}")
    @event = Event.find(params[:event_id])
    @candidate = Candidate.find(params[:candidate_id])
    respond_with(@candidate, @event)
  end
end
