class PagesController < ApplicationController
  def index
    @leaders ||= Product.limit(3)
  end
end
