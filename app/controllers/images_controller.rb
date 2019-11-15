class ImagesController < ApplicationController
    before_action :set_image, only: [:show, :edit, :update, :destroy]
    before_action :require_admin

    def index
        @images = Image.all    
    end

    def new
        @image = Image.new
    end

    def create
        @image = Image.new(image_params)
        if @image.save
            redirect_to @image
        else 
            flash[:errors] = @image.errors.full_messagers
            redirect_to new_image_path
        end
    end

    def show
        
    end

    def edit
        
    end

    def update
        @image.update image_params
        redirect_to @image
    end

    def destroy
        @image.destroy
        
        redirect_to images_path
    end


    private

    def set_image
        @image = Image.find(params[:id])
    end
    def image_params
        params.require(:image).permit(:img_url, :answer)
    end
end
