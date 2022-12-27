class MainController < ApplicationController
    def index
        @files = MidiFile.public_songs
    end
end
