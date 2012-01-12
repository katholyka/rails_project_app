class BookingsController < ApplicationController
load_and_authorize_resource
def index
    @bookings=Booking.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
        format.html
    end

end

def new
    @booking = Booking.new
    @customers=Customer.all

    respond_to do |format|
      format.html # new.html.erb
    end
end

def create
    @booking = Booking.new(params[:booking])

    respond_to do |format|
      if @booking.save
        format.html { redirect_to(@booking, :notice => 'Booking was successfully created.') }
       
      else
        format.html { render :action => "new" }
       
      end
    end
  end

def show
    @booking = Booking.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      
    end
  end

def edit
    @booking = Booking.find(params[:id])
    @customers=Customer.all
  end

def update
    @booking = Booking.find(params[:id])

    respond_to do |format|
      if @booking.update_attributes(params[:booking])
        format.html { redirect_to(@booking, :notice => 'Booking was successfully updated.') }
        
      else
        format.html { render :action => "edit" }
        
      end
    end
  end

  
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to(bookings_url) }
      
    end
  end

end
