class Ranking < ApplicationRecord
    belongs_to: movie

    def give_ranking
        if user.tickets < attraction.tickets && user.height < attraction.min_height
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif user.tickets < attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif user.height < attraction.min_height
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
            ride_time
        end
    end

    def ride_time
        updated_tickets = user.tickets - attraction.tickets
        updated_nausea = user.nausea + attraction.nausea_rating
        updated_happiness = user.happiness +  attraction.happiness_rating 
        user.update(tickets: updated_tickets, nausea: updated_nausea, happiness: updated_happiness)
        "Thanks for riding the #{attraction.name}!"
    end

end

# def movie
# def movie=
# def build_movie
# def movie_id
# def movie.id=