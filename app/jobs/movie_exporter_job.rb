class MovieExporterJob < ApplicationJob
  queue_as :export

  def perform(user, file_path = "tmp/movies.csv")
    MovieServices::Exporter.new.call(user, file_path)
  end
end
