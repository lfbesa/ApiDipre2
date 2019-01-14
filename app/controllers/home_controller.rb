class HomeController < ApplicationController
   before_action :authenticate_user!, :except => [:privacy]
  def index
  end

  def privacy
  end

end
