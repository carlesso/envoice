class InvoicesController < ApplicationController
  def new
    @invoice = Invoice.new
    @invoice.items.build
  end
  
  def create
    @invoice = Invoice.new params[:invoice]
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
    @invoice = Invoice.find params[:id]
    respond_to do |format|
      format.html
      format.xml  { render :xml => @invoice }
    end
  end
end