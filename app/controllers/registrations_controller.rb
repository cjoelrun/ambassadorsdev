class RegistrationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
    @registrations = @user.registrations

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registrations }
    end
  end

  def show
    @registration = Registration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @registration }
    end
  end

  def new
    @registration = Registration.new

    respond_to do |format|
      format.html
      format.json { redner json: @registration }
    end
  end

  def edit
    @user = current_user
    @registration = Registration.find(params[:id])
  end

  def create
    @registration = Registration.new(params[:registration])
    respond_to do |format|
      if @registration.save
        format.html { redirect_to @registration, notice: 'Registration was successfully created.' }
        format.json { render json: @registration, status: :created, location: @registration }
      else
        format.html { render action: "new" }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy

    respond_to do |format|
      format.html { redirect_to registrations_url }
      format.json { head :ok }
    end
  end
end
