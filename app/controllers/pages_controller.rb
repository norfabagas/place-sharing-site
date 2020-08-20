class PagesController < ApplicationController
  require 'pages_helper'

  include PagesHelper

  before_action :authenticate_user!

  def home
    @places = Place.order('created_at DESC').page params[:page]
  end

  def profile
    @user = User.where('username = ?', params[:username]).first

    if @user.nil?
      return redirect_to root_path
    end

    @follow = Follow.where('follower_id = ? and following_id = ?', current_user.id, @user.id).first
  end

  def user
    @user = User.find(current_user.id)
  end

  def follow_or_unfollow
    follower_id = params[:follower_id]
    following_id = params[:following_id]
    url_path = params[:url_path]

    follow = Follow.where('follower_id = ? and following_id = ?', follower_id, following_id).first
    if follow
      follow.destroy!
      msg = "You just unfollowed #{User.find(following_id).username}"
    else
      Follow.create(follower_id: follower_id, following_id: following_id)
      msg = "Now you're following #{User.find(following_id).username}"
    end

    return redirect_to url_path, notice: msg
  end

  def following
    following = Follow.where('follower_id = ?', current_user.id).pluck(:following_id)
    @places = Place.where(:user_id => following).order('created_at DESC').page
  end
end
