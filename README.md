## Ruby face detection example

This is a simple example of using the AWS Rekognition API to sort photos into either `has_face` or `no_face`.

### Installation

1. Run `bundle install` to install libraries.
2. Run `cp .env.example .env`, and edit `.env` so that it contains valid AWS credentials with access to [Rekognition](https://aws.amazon.com/rekognition/).
3. Put the images you would like to sort into the `to_sort/` folder.
4. Run `ruby sort.rb` to run the sorting script. It will check for faces via Rekognition's [detect_faces](https://docs.aws.amazon.com/sdkforruby/api/Aws/Rekognition/Client.html#detect_faces-instance_method) method, and put photos into either the `has_face/` or `no_face/` folders based on the result.

Edit `sort.rb` and change the `MINIMUM_CONFIDENCE` if you'd like to be more or less lenient on what is considered a positive result.
