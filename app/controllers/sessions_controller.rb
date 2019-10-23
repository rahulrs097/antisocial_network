# warn_indent: true
# frozen_string_literal: true

# Controller for managing sesssions
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now.alert = 'Invalid username or password'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
