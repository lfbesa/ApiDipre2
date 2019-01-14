class HomeController < ApplicationController
  skip_before_action :authenticate, only: [:privacy]

  def index
  end

  def privacy
  end

end
