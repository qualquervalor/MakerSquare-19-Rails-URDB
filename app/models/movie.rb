class Movie < ActiveRecord::Base
  has_many :showtimes
  has_many :roles
  has_many :stars, through: :roles
  validates :title, presence: true

   def self.average_rating

      #get all movie scores
      movies = self.all

    #add all movie scores together
    sum =0
    count = 0
    movies.each do |x|
      if !x.audience_rating.nil?
        sum += x.audience_rating
        count +=1
      end  
    end

    #divide by number of movies
    if (count ==0)
      nil
    else
      sum/count  
    end
  end
    
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
