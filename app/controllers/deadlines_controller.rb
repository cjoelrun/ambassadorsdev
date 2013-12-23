class DeadlinesController < ApplicationController
  # GET /deadlines
  # GET /deadlines.json
  def index
    @deadlines = Deadline.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deadlines }
    end
  end

  # GET /deadlines/1
  # GET /deadlines/1.json
  def show
    @deadline = Deadline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @deadline }
    end
  end

  # GET /deadlines/new
  # GET /deadlines/new.json
  def new
    @deadline = Deadline.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deadline }
    end
  end

  # GET /deadlines/1/edit
  def edit
    @deadline = Deadline.find(params[:id])
  end

  # POST /deadlines
  # POST /deadlines.json
  def create
    @deadline = Deadline.new(params[:deadline])

    respond_to do |format|
      if @deadline.save
        format.html { redirect_to @deadline, notice: 'Deadline was successfully created.' }
        format.json { render json: @deadline, status: :created, location: @deadline }
      else
        format.html { render action: "new" }
        format.json { render json: @deadline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /deadlines/1
  # PUT /deadlines/1.json
  def update
    @deadline = Deadline.find(params[:id])

    respond_to do |format|
      if @deadline.update_attributes(params[:deadline])
        format.html { redirect_to @deadline, notice: 'Deadline was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deadline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deadlines/1
  # DELETE /deadlines/1.json
  def destroy
    @deadline = Deadline.find(params[:id])
    @deadline.destroy

    respond_to do |format|
      format.html { redirect_to deadlines_url }
      format.json { head :no_content }
    end
  end
end
