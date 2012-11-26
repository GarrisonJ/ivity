class HappeningsController < ApplicationController
  # GET /happenings
  # GET /happenings.json
  def index
    @happenings = Happening.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @happenings }
    end
  end

  # GET /happenings/1
  # GET /happenings/1.json
  def show
    @happening = Happening.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @happening }
    end
  end

  # GET /happenings/new
  # GET /happenings/new.json
  def new
    @happening = Happening.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @happening }
    end
  end

  # GET /happenings/1/edit
  def edit
    @happening = Happening.find(params[:id])
  end

  # POST /happenings
  # POST /happenings.json
  def create
    @happening = Happening.new(params[:happening])

    respond_to do |format|
      if @happening.save
        format.html { redirect_to @happening, :notice => 'Happening was successfully created.' }
        format.json { render :json => @happening, :status => :created, :location => @happening }
      else
        format.html { render :action => "new" }
        format.json { render :json => @happening.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /happenings/1
  # PUT /happenings/1.json
  def update
    @happening = Happening.find(params[:id])

    respond_to do |format|
      if @happening.update_attributes(params[:happening])
        format.html { redirect_to @happening, :notice => 'Happening was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @happening.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /happenings/1
  # DELETE /happenings/1.json
  def destroy
    @happening = Happening.find(params[:id])
    @happening.destroy

    respond_to do |format|
      format.html { redirect_to happenings_url }
      format.json { head :no_content }
    end
  end
end
