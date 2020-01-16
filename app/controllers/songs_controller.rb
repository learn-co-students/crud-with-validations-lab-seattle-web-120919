class SongsController < ApplicationController
    before_action :find_song, only: [:show, :edit, :update, :destroy]
    def index 
        @songs = Song.all
    end

    # def show 
        
    # end

    def new
        @song = Song.new
    end

    def create 
        @song = Song.new(params.require(:song).permit!)
        if @song.save
            redirect_to song_path(@song)
        else 
            render :new
        end
    end

    # def edit 

    # end

    def update
        if @song.update(params.require(:song).permit!)
            redirect_to song_path(@song)
        else 
            render :edit
        end
    end

    def destroy
        @song.destroy
        redirect_to songs_path
    end

    private 

    def find_song
        @song = Song.find(params[:id])
    end
end
