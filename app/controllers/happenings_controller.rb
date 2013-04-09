class HappeningsController < ApplicationController

before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
# before_filter :require_login, :only => [:index] # Will not show error message
layout "application-no-toolbar", :only => [:search]
  # GET /happenings
  # GET /happenings.json
  def index
    if params[:tag]
      @happenings = Happening.where("time_of > ?", Date.yesterday).tagged_with(params[:tag]).reverse_order.page(params[:page]).per(10)
    elsif params[:search]
      @happenings = Happening.where("time_of > ?", Date.yesterday).tagged_with("#{params[:search]}").reverse_order.page(params[:page]).per(10)
    else
      @happenings = Happening.where("time_of > ?", Date.yesterday).order("time_of").reverse_order.page(params[:page]).per(10)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @happenings }
    end
  end

  def search
    if params[:tag]
      @happenings = Happening.where("time_of > ?", Date.yesterday).tagged_with(params[:tag]).reverse_order.page(params[:page]).per(10)
    elsif params[:search]
      @happenings = Happening.where("time_of > ?", Date.yesterday).tagged_with("#{params[:search]}").reverse_order.page(params[:page]).per(10)
    else
      @happenings = Happening.where("time_of > ?", Date.yesterday).order("time_of").reverse_order.page(params[:page]).per(10)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @happenings }
    end
  end

  # GET /happenings/1
  # GET /happenings/1.json
  def show
    @favorites = Happening.find(params[:id]).favorites
    @happening = Happening.find(params[:id])
    @json = Happening.find(params[:id]).to_gmaps4rails
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
    @happening = current_user.happenings.new(params[:happening])

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
    @happening = current_user.happenings.find(params[:id])
    if params[:happening] && params[:happening].has_key?(:user_id)
      params[:happening].delete(:user_id) 
    end
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
    @happening = current_user.happenings.find(params[:id])

    if params[:happening] && params[:happening].has_key?(:user_id)
      params[:happening].delete(:user_id) 
    end

    respond_to do |format|
      if @happening.destroy
        format.html { redirect_to happenings_url }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @happening.errors, :status => :unprocessable_entity }
      end
    end
  end

def require_login
    unless signed_in?
      redirect_to login_path # halts request cycle
    end
  end


end
