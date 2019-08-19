require 'aws-sdk-rekognition'
require 'dotenv'
require 'fileutils'

Dotenv.load

# The minimum confidence percentage we require to consider something a 'face' - a number between 0 and 100.
MINIMUM_CONFIDENCE = 95

client  = Aws::Rekognition::Client.new
entries = Dir.glob(File.join(Dir.pwd, 'to_sort', '*.{jpg,jpeg,gif,png}'))

entries.each do |path|
  response    = client.detect_faces(image: { bytes: File.read(path) })
  no_face     = response.face_details.find { |face| face.confidence >= MINIMUM_CONFIDENCE }.nil?
  destination = no_face ? 'no_face' : 'has_face'
  basename    = File.basename(path)

  puts "Moving #{basename} to #{destination}"
  FileUtils.mv(path, File.join(Dir.pwd, destination, basename))
end
