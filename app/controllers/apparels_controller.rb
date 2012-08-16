class ApparelsController < ApplicationController
  authorize_resource
  # GET /apparels
  # GET /apparels.json
  def index
    @apparels = Apparel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apparels }
    end
  end

  # GET /apparels/1
  # GET /apparels/1.json
  def show
    @apparel = Apparel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @apparel }
    end
  end

  # GET /apparels/new
  # GET /apparels/new.json
  def new
    @apparel = Apparel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @apparel }
    end
  end

  # GET /apparels/1/edit
  def edit
    @apparel = Apparel.find(params[:id])
  end

  # POST /apparels
  # POST /apparels.json
  def create
    @apparel = Apparel.new(params[:apparel])

    respond_to do |format|
      if @apparel.save
        format.html { redirect_to @apparel, notice: 'Apparel was successfully created.' }
        format.json { render json: @apparel, status: :created, location: @apparel }
      else
        format.html { render action: "new" }
        format.json { render json: @apparel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /apparels/1
  # PUT /apparels/1.json
  def update
    @apparel = Apparel.find(params[:id])

    respond_to do |format|
      if @apparel.update_attributes(params[:apparel])
        format.html { redirect_to @apparel, notice: 'Apparel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @apparel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apparels/1
  # DELETE /apparels/1.json
  def destroy
    @apparel = Apparel.find(params[:id])
    @apparel.destroy

    respond_to do |format|
      format.html { redirect_to apparels_url }
      format.json { head :no_content }
    end
  end
end
