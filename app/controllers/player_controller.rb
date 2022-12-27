class PlayerController < ApplicationController
  def play
    #TODO: Сделать валидацию на возможность доступа к файлу
    @current_song = MidiFile.find(params[:id]);
    unless @current_song.available_for?(session[:user_id])
      redirect_to root_path
    end
  end
end
