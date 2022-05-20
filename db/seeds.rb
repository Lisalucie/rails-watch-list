require 'open-uri'
require 'json'

Movie.destroy_all

url = "http://tmdb.lewagon.com/movie/top_rated"
10.times do |m|
page = JSON.parse(URI.open("#{url}?page=#{m + 1}").read)
movies = page["results"]
movies.each do |movie|
  Movie.create(
              title: movie["original_title"],
              overview: movie["overview"],
              rating: movie["vote_average"],
              poster_url: "https://image.tmdb.org/t/p/original/#{movie["poster_path"]}")
  end
end
