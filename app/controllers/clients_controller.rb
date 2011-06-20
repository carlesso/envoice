class ClientsController < ApplicationController
  def index
    @clients = current_user.clients.paginate :page => 1, :per_page => 10
  end
  
  def new
    @client = current_user.clients.new
    @client.contacts.build
  end
  
  def create
    @client = current_user.clients.new params[:client]
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
    @client = current_user.clients.find params[:id]
    respond_to do |format|
      format.html
      format.xml  { render :xml => @client }
    end
  end
  
  def destroy
    @client = current_user.clients.find(params[:id])
    @client.destroy
    respond_to do |format|
      format.html { redirect_to(clients_path, :notice => 'Client was successfully removed.')  }
    end
  end
end