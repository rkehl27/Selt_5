class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 R)
  end

  def self.find_in_tmdb(title)
    matched_movies = Tmdb::Movie.find(title)
    @movies = []
    matched_movies.each do |movie|
      @movies << {:title => movie.title, :release_date => movie.release_date, :rating => "G", :tmdb_id => movie.id}
    end
    return @movies
  end
end
