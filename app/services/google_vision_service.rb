# Imports the Google Cloud client library
require "google/cloud/vision"

class GoogleVisionClass
  # Your Google Cloud Platform project ID
  project_id = "ocr-tickets-174816"

  # Instantiates a client
  vision = Google::Cloud::Vision.new project: project_id

  # The name of the image file to annotate
  file_name = "./images/ticket.jpg"

  # Performs label detection on the image file
  labels = vision.image(file_name).labels

  puts "Labels:"
  labels.each do |label|
    puts label.description
  end
end
