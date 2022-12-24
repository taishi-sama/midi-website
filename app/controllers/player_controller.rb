class PlayerController < ApplicationController
  def play
    #TODO: Сделать валидацию на возможность доступа к файлу
    @current_song = MidiFile.find(params[:id]);
  end
end
