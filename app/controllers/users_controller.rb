class UsersController < ApplicationController

  def edit

  end

  def show

  end

  def forgotten
    redirect_back fallback_location: '/'
  end

  def update
    redirect_back fallback_location: '/'
  end

  def destroy
    redirect_back fallback_location: '/'
  end
end
