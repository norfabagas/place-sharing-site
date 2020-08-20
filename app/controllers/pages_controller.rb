class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @places = Place.order('created_at DESC').page params[:page]
  end

  def profile
    @user = User.where('username = ?', params[:username]).first
    if @user.nil?
      return redirect_to :back
    end
  end
end
