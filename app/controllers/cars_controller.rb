class CarsController < ApplicationController
before_filter :authenticate_user!
load_and_authorize_resource
def index
    @cars=Car.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
        format.html
    end

end

def new
    @car = Car.new
    @customers=Customer.all
    @models=Model.all
 
    respond_to do |format|
      format.html # new.html.erb
    end
end

def create
    @car = Car.new(params[:car])

    respond_to do |format|
      if @car.save
        format.html { redirect_to(@car, :notice => 'Car was successfully created.') }
       
      else
        format.html { render :action => "new" }
       
      end
    end
  end

def show
    @car = Car.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
end

def edit
    @car = Car.find(params[:id])
end

def update
    @car = Car.find(params[:id])

    respond_to do |format|
      if @car.update_attributes(params[:car])
        format.html { redirect_to(@car, :notice => 'Car was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
end

def destroy
    @car  = Car.find(params[:id])
    @car.destroy

    respond_to do |format|
      format.html { redirect_to(cars_url) }
    end
end

end
