class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    pp auth
    user = User.from_omniauth(auth)
    session[:user_id] = user.id
    session[:access_token] = auth["credentials"]["token"]
    redirect_to root_url, notice: "Signed in." 
  end

  def destroy
    session[:user_id] = nil
    session[:access_token] = nil
    redirect_to root_url, notice: "Signed out."
  end
end
