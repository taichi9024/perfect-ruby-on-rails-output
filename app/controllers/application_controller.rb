class ApplicationController < ActionController::Base

    def login?
        !!session[:user_id]
    end
    helper_method :login?
end
