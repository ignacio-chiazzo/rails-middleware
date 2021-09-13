class ProductsController < ApplicationController
  def index
    respond_to do |format|
      format.json { render(json: {} ) }
    end
  end

  def show
    respond_to do |format|
      format.json { render(json: {} ) }
    end
  end
end
