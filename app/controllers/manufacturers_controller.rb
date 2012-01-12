class ManufacturersController < ApplicationController

before_filter :authenticate_user!
load_and_authorize_resource

def index
    @manufacturers=Manufacturer.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
        format.html
    end

end

def new
    @manufacturer = Manufacturer.new
    
    respond_to do |format|
      format.html # new.html.erb
    end
end

def create
    @manufacturer = Manufacturer.new(params[:manufacturer])

    respond_to do |format|
      if @manufacturer.save
        format.html { redirect_to(@manufacturer, :notice => 'Manufacturer was successfully created.') }
       
      else
        format.html { render :action => "new" }
       
      end
    end
  end

def show
    @manufacturer = Manufacturer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
end

def edit
    @manufacturer = Manufacturer.find(params[:id])
end

def update
    @manufacturer = Manufacturer.find(params[:id])

    respond_to do |format|
      if @manufacturer.update_attributes(params[:manufacturer])
        format.html { redirect_to(@manufacturer, :notice => 'Manufacturer was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
end

def destroy
    @manufacturer  = Manufacturer.find(params[:id])
    @manufacturer.destroy

    respond_to do |format|
      format.html { redirect_to(manufacturers_url) }
    end
end


end
