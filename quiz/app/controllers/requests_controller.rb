class RequestsController < ApplicationController
  before_action :find_request, only: [:show, :edit, :update, :destroy]
  def new
    @request = Request.new
  end

  def create
  request_params = params.require(:request).permit(:name, :email, :department, :message)
  @request = Request.new request_params
    if @request.save
      redirect_to request_path(@request)
      flash[:notice] = "Supprt request created!"
    else
      flash[:alert] = "Support request could not be created."
      render (:new)
    end
  end

  def show
  end

  def index
    if params[:search_item]
       @search_item = params[:search_item]
       @requests = Request.where(["name ILIKE ? OR email ILIKE ? OR department ILIKE ? OR message ILIKE ?", "%#{@search_item}%","%#{@search_item}%","%#{@search_item}%","%#{@search_item}%"]).page(params[:page])
     else
       #@requests = Request.order(created_at: :desc).page(params[:page])
       @requests = Request.order("id DESC").page(params[:page])
     end

  if params[:id]
    @request = Request.find params[:id]
    @request.status == false ? @request.status = true : @request.status = false
    @request.save
  end


  end

  def update
    request_params = params.require(:request).permit(:name, :email, :department, :message, :completed)
    @request       = Request.find params[:id]
    if @request.update request_params
      redirect_to request_path(@request)
    else
      render :edit
    end
  end

  def destroy
    @request.destroy
    redirect_to requests_path
    flash[:alert] = "Support Request deleted!"
  end

  # def self.search(keyword)
  #   where("name || email || department || message ILIKE ?","%#{keyword}%")
  # end


  private

def find_request
  @request = Request.find params[:id]
end

def request_params
  params.require(:request).permit(:name, :email, :department, :message)
end





end
