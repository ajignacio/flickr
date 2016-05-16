class HomeController < ApplicationController

  def index
    arry = []
    if params[:search].present?
      request_command = {search: params[:search]}
      search = Flickr::Search.new(request_command)
      arry = search.search_flickr
    end
    @search_flickr = arry.paginate(page: params[:page], per_page: 9)
  end
end
