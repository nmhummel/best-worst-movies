module MoviesHelper

    def cu_header
        if !current_user
          a.tag("#{link_to} Sign Up To Write A Review, #{signup_path}")
        end
    end

    def poster?
      if @movie.poster.attached?
        image_tag url_for(@movie.poster.variant(resize: "150x200").processed.service_url)
      else
        image_tag("stinky-cheese.png", :size => '150x200')
      end
    end

end
