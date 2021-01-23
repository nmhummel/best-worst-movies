module RankingsHelper

    def average_average
        if current_movie.rankings.avg_average.blank?
            "Not enough data to compute."
        else 
            current_movie.rankings.avg_average.round(2)
        end
    end

end
