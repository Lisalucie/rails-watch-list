require 'open-uri'
require 'json'

# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
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

Bookmark.create(comment: "i love it", movie: "Wonder Woman 1984", list: "Favorites of all times")
