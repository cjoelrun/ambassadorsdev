class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @events = current_user.events
    @registration = Registration.find_by_user_id_and_event_id(current_user.id, @event.id)

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
  # POST /events.json
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

  def add
    @event = Event.find(params[:id])
    user = User.find(params[:user_id])
    @registrion = user.registrations.build :event_id => @event.id, :user_id => user.id, :registration_status_id => RegistrationStatus.first.id
    respond_to do |format|
      if @registrion.save
        format.html { redirect_to @event, notice: 'Registrion was successfully created.' }
        format.json { render json: @registration, status: :created, location: @registration.event }
      else
        format.html { redirect_to @event, alert: 'Registration failed' }
        format.html { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

end