class UrlsController < ApplicationController
    before_action :set_url, only: [:show, :edit, :update, :destroy]

    def index
        @urls = Url.all
    end

    def show; end


    def new
      @url = Url.new
    end

    def edit; end


    def create
        @url = Url.new(url_params)

        respond_to do |format|
            if @url.save
                format.html { redirect_to @url, notice: 'Url was successfully created.' }
                format.json { render :show, status: :created, location: @url }
            else
                format.html { render :new }
                format.json { render json: @url.errors, status: :unprocessable_entity }
            end
        end
    end


    def update
        respond_to do |format|
            if @url.update(url_params)
                format.html { redirect_to @url, notice: 'Url was successfully updated.' }
                format.json { render :show, status: :ok, location: @url }
            else
                format.html { render :edit }
                format.json { render json: @url.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @url.destroy
        respond_to do |format|
            format.html { redirect_to urls_url, notice: 'Url was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    def srtly
        @url = Url.find_by(short_code: params[:short_code])
        redirect_to @url.original_url
    end

    private

    def set_url
        @url = Url.find(params[:id])
    end

    def url_params
        params.require(:url).permit(:original_url, :short_url, :short_code)
    end
end
