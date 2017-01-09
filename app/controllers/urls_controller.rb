class UrlsController < ApplicationController

  def index
    @url = Url.new
  end

  def show
    @url = Url.find(params[:id])
  end

  def srtly
    @url = Url.find_by(short_url: params[:short_url])
    @url.clicks += 1
    redirect_to @url.original_url
  end

  def create
    @url = Url.new
    if @url.save
      flash[:notice]= "URL successfully shortened."
      redirect_to @url
    else
      flash[:alert]= "Something went wrong. Please try again."
      render 'new'
    end
  end

  private

  def url_params
    params.require.(:url).permit(:original_url, :short_url, :clicks)
  end
end
