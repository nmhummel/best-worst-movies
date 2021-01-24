class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
    include ApplicationHelper

    # def route_not_found
    #     render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
    # end

    def verified_user
        redirect_to '/' unless user_is_authenticated
    end
    
    def require_login
        return redirect_to(controller: 'session', action: 'new') unless user_is_authenticated
    end

    def handle_record_not_found
        # Send it to the view that is specific for Post not found
        return render '/rescue/not_found'
    end
    
    ########################

    def login(user)
        session[:user_id] = user.id
    end

    def page_not_found
        return render 'errors/page_not_found', status: 404
    end

    def redirect_if_not_admin # Admin actions (including /users) - skip redirect_if_not_permitted and add this when all error pages are operational
        if !is_admin?
            redirect_to '/'
        end
    end
  
    def check_valid(object)
        if object.errors.messages.empty?
            flash[:alert] = nil
        else
            flash[:alert] = "#{object.class.to_s} invalid, please review errors"
        end
    end

    # def redirect_if_not_permitted # All non get requests and edit routes if not logged in and no permission to edit
    #     if !admin?
    #         if request.method != "GET"
    #             redirect_to_root unless logged_in? && permitted # Malicious post requests
    #         elsif action_name == "edit"
    #             page_not_found unless logged_in? && permitted # Not permitted to edit this resource error add
    #         elsif action_name == "new"
    #             page_not_found unless logged_in? # Log in to create this resource error add
    #         end
    #     end
    # end

end
