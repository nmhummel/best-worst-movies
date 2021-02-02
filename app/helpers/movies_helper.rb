module MoviesHelper

    def cu_header
        if !current_user
          link_to "Sign Up or Log In to Rank a Movie!", signup_path
        end
    end

    def poster?
      if @movie.poster.attached?
        image_tag url_for(@movie.poster)
      else
        image_tag("stinky-cheese.png")
      end
    end

    def current_movie
      @current_movie ||= Movie.find_by_id(:id) 
    end

    def rewatch_percent
      true_count = @movie.rankings.where(watch_again: true).count.to_f
      total_count = @movie.rankings.count.to_f
      percentage = (true_count / total_count).round(2)*100
    end

    def authorized_movie?
      is_admin? || @movie.user_id == current_user.id if current_user
    end

    def has_ranked?
      @movie.rankings.where(user_id: current_user.id).exists? if current_user
    end

end
