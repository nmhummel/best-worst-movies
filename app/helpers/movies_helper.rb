module MoviesHelper

    def cu_header
        if !current_user
          a.tag("#{link_to} Sign Up To Write A Review, #{signup_path}")
        end
    end

end
