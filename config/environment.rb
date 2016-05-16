# Load the rails application
require File.expand_path('../application', __FILE__)
require 'flickraw'

#FlickRaw.api_key = ENV['FLICKR_API_KEY']
#FlickRaw.shared_secret = ENV['FLICKR_SECRET_KEY']

# Initialize the rails application
FlickrPhoto::Application.initialize!
