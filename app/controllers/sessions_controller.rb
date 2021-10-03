class SessionsController < ApplicationController
  before_action :authenticate_request!, only: :logout
  

  def login
    user = User.find_by(email: params[:user][:email])
    user = user&.authenticate(params[:user][:password])

    if user
      session = Session.create(user_id: user.id, expiry_at: DateTime.now + 2.hours + 30.minutes)
      render json: payload(session, user), status: :ok
    else
      render json: {errors: ['Email/Senha incorretos']}, status: :unauthorized
    end
  end

  def logout
    if @active_session.close
      render status: :ok
    else
      render json: @active_session.errors
    end
  end
end