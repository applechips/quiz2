class WelcomeController < ApplicationController

  def index
  end

  def thankyou
    @name = params[:name]
  end

end
