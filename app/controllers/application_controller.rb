class ApplicationController < ActionController::API
  attr_reader :current_user

  rescue_from CanCan::AccessDenied do |exception|
    render json: {message:"Permissao Negada, voce nao tem acesso a esse conteúdo"}, status: 403
  end

  protected

    def payload session, user
      return nil unless user and user.id
      {
        auth_token: JsonWebToken.encode({session_id: session.id}),
        user: {
          id: user.id, 
          email: user.email,
          name: user.name, 
          role: user.role
        }
      }
    end

    def authenticate_request!
      unless session_id_in_token? and session_active?
        render json: { errors: ['Not Authenticated'] }, status: :unauthorized
        return
      end
      @active_session.refresh
      @current_user = @active_session.user
    rescue JWT::VerificationError, JWT::DecodeError
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
    end

  private

    def http_token
      @http_token ||= if request.headers['Authorization'].present?
        request.headers['Authorization'].split(' ').last
      end
    end

    def auth_token
      @auth_token ||= JsonWebToken.decode(http_token)
    end

    def session_id_in_token?
      http_token && auth_token && auth_token[:session_id].to_i
    end

    def session_active?
      @active_session = Session.find(auth_token[:session_id])
      @active_session.active?
    end
end
