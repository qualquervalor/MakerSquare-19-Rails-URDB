class Movie < ActiveRecord::Base
  has_many :showtimes
  has_many :roles
  has_many :stars, through: :roles

  def rotten_finder
    RottenMovie.find(title: title, limit: 1)
  end
  
  def snippet
    description.truncate 50
  end

  def audience_rating
    movie = rotten_finder(title)
    if (movie.length == 0)
      movie
    else
      movie.ratings.audience_score
    end
  end

end
