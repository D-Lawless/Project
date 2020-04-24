class HomeController < ApplicationController
  def feed
    @events = Event.all.order("created_at DESC")
  end
end
