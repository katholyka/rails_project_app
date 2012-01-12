class CustomersController < ApplicationController
#before_filter :authenticate_user!
before_filter :authenticate_user!
load_and_authorize_resource

layout 'application'


def index

    @customers = Customer.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
     
    end
end

def new
    @customer=Customer.new

    respond_to do |format|
        format.html
    end

end

def create
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      if @customer.save
        format.html { redirect_to(@customer, :notice => 'Customer was successfully created.') }
        
      else
        format.html { render :action => "new" }
        
      end
    end
  end

def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
end

def edit
    @customer = Customer.find(params[:id])
end

def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to(@customer, :notice => 'Customer was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
end

def destroy
    @customer  = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to(customers_url) }
    end
end

end
