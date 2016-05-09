class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if (user.tickets||=0) < attraction.tickets && (user.height||=0) < attraction.min_height
      return "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif (user.tickets||=0) < attraction.tickets
      return "Sorry. You do not have enough tickets the #{attraction.name}."
    elsif (user.height||=0) < attraction.min_height
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
   
    user.tickets -= attraction.tickets
    user.happiness += attraction.happiness_rating
    user.nausea += attraction.nausea_rating
    user.save
      return "Thanks for riding the #{attraction.name}!"
  end
end
