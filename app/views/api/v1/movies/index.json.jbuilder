json.array! @movies do |movie|
  json.id movie.id
  json.title movie.title

  if @with_genre
    json.genre do
      json.id movie.genre.id
      json.name movie.genre.name
      json.count movie.genre.movies.count
    end
  end
end
