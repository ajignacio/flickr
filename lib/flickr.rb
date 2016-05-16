module Flickr
  class Search
    attr_accessor :search

    def initialize(options = {})
      @flickr_key = ENV['FLICKR_API_KEY']
      @flickr_secret = ENV['FLICKR_SECRET_KEY']
      @search = options[:search]
    end

    def search_flickr
      flickr_api
      data_holder = []
        flickr.photos.search(tags: @search).to_a.each do |dt|
          info = flickr.photos.getInfo(photo_id: dt['id'])
          data_holder << {
            id: dt['id'],
            url: FlickRaw.url(info),
            title: dt['title'],
            taken: info['dates']['taken'],
            description: info['description']
          }
        end
      data_holder
    end

    def flickr_api
      FlickRaw.api_key = @flickr_key
      FlickRaw.shared_secret = @flickr_secret
    end

  end
end

