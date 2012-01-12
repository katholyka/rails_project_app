class MechanicsController < ApplicationController

before_filter :authenticate_user!
load_and_authorize_resource

def index
    @mechanics=Mechanic.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
        format.html
    end

end

def new
    @mechanic = Mechanic.new
    @bookings=Booking.all
    
 
    respond_to do |format|
      format.html # new.html.erb
    end
end

def create
    @mechanic = Mechanic.new(params[:mechanic])

    respond_to do |format|
      if @mechanic.save
        format.html { redirect_to(@mechanic, :notice => 'Mechanic was successfully created.') }
       
      else
        format.html { render :action => "new" }
       
      end
    end
  end

def show
    @mechanic = Mechanic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
end

def edit
    @mechanic = Mechanic.find(params[:id])
end

def update
    @mechanic = Mechanic.find(params[:id])

    respond_to do |format|
      if @mechanic.update_attributes(params[:mechanic])
        format.html { redirect_to(@mechanic, :notice => 'Mechanic was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
end

def destroy
    @mechanic  = Mechanic.find(params[:id])
    @mechanic.destroy

    respond_to do |format|
      format.html { redirect_to(mechanics_url) }
    end
end

end
