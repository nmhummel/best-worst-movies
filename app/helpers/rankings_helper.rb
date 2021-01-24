module RankingsHelper

    def rewatch?
        if @rankings.watch_again == true
            "Humbly, yes."
        else
            "Heck no!"
        end
    end



end
