class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
    include ApplicationHelper


    def handle_record_not_found
        # Send it to the view that is specific for Post not found
        return render '/rescue/not_found'
    end


end
