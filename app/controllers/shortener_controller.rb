class ShortenerController < ApplicationController

  def index

  end

  def create
    url = Url.create(:original_url => params[:original_url])

    id = url.id

    redirect_to "/#{id}?stats=true"

  end

  def show
    @original_url = Url.find(params[:id]).original_url
    @host_url = request.base_url
    @url_path = params[:id]
  end

end