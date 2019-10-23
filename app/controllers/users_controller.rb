# warn_indent: true
# frozen_string_literal: true

# Users Controller used for authentication purposes only.
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.username = params[:user][:username]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      redirect_to root_url, notice: 'Signed up!'
    else
      render 'new'
    end
  end
end
