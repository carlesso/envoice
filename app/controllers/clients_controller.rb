class ClientsController < ApplicationController
  def new
    @client = Client.new
    @client.contacts.build
  end
  
  def create
    @client = Client.new params[:client]
    respond_to do |format|
      if @client.save
        format.html { redirect_to(@client, :notice => 'Client was successfully inserted.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @client = Client.find params[:id]
    respond_to do |format|
      format.html
      format.xml  { render :xml => @client }
    end
  end
end