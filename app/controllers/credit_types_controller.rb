class CreditTypesController < ApplicationController
  authorize_resource
  # GET /credit_types
  # GET /credit_types.json
  def index
    @credit_types = CreditType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @credit_types }
    end
  end

  # GET /credit_types/1
  # GET /credit_types/1.json
  def show
    @credit_type = CreditType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @credit_type }
    end
  end

  # GET /credit_types/new
  # GET /credit_types/new.json
  def new
    @credit_type = CreditType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @credit_type }
    end
  end

  # GET /credit_types/1/edit
  def edit
    @credit_type = CreditType.find(params[:id])
  end

  # POST /credit_types
  # POST /credit_types.json
  def create
    @credit_type = CreditType.new(params[:credit_type])

    respond_to do |format|
      if @credit_type.save
        format.html { redirect_to @credit_type, notice: 'Credit type was successfully created.' }
        format.json { render json: @credit_type, status: :created, location: @credit_type }
      else
        format.html { render action: "new" }
        format.json { render json: @credit_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /credit_types/1
  # PUT /credit_types/1.json
  def update
    @credit_type = CreditType.find(params[:id])

    respond_to do |format|
      if @credit_type.update_attributes(params[:credit_type])
        format.html { redirect_to @credit_type, notice: 'Credit type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @credit_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_types/1
  # DELETE /credit_types/1.json
  def destroy
    @credit_type = CreditType.find(params[:id])
    @credit_type.destroy

    respond_to do |format|
      format.html { redirect_to credit_types_url }
      format.json { head :no_content }
    end
  end
end
