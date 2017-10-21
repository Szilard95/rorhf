class LoginController < ApplicationController
  def index

  end

  def login
    redirect_to '/'
  end

  def logout
    redirect_to '/'
  end
end
