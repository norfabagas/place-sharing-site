class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @places = Place.order('created_at DESC')
  end
end
