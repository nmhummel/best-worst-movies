module MoviesHelper

    def cu_header
        if !current_user
          link_to "Sign up to Rank a Movie!", signup_path
        end
    end

    def poster?
      if @movie.poster.attached?
        image_tag url_for(@movie.poster.variant(resize: "150x300").processed.service_url)
      else
        image_tag("stinky-cheese.png", :size => '150x200')
      end
    end



end
