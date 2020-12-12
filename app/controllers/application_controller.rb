class ApplicationController < ActionController::Base
    helper_method :login?
    helper_method :current_user
    helper_method :login_first

    before_action :login_first

    def login?
        !!session[:user_id]
    end

    def current_user
        return unless session[:user_id]
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def login_first
        return login?
        redirect_to root_path, notice: "ログインして下さい"
    end

end
