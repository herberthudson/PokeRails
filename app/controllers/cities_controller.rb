class CitiesController < ApplicationController
  def index
  end

  def view
    @param = params[:city]
  end
end
