class InvoicesController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:new, :create]
  def index
    @invoices = current_user.invoices.paginate :page => 1, :per_page => 10
  end
  
  def new
    # @invoice = current_user.invoices.new
    @invoice.items.build
  end
  
  def create
    @invoice = current_user.invoices.new params[:invoice]
    respond_to do |format|
      if @invoice.save
        format.html { redirect_to(@invoice, :notice => 'Invoice was successfully created.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invoice.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    # @invoice = Invoice.find params[:id]
    respond_to do |format|
      format.html
      format.xml  { render :xml => @invoice }
      format.pdf
    end
  end
  def edit
  end
  
  def update
    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to(@invoice, :notice => 'Invoice was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invoice.errors, :status => :unprocessable_entity }
      end
    end
  end
end