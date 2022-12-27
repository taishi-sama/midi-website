class UserfilesController < ApplicationController
  before_action :authenticate_user
  def new
    @files = User.find(session[:user_id]).midi_files.all
  end
  def create
    p = midifile_params;
    f = User.find(session[:user_id]).midi_files.new(p);
    unless f.save
      flash[:error] = f.errors.full_messages;
      f.midi.purge
    else
      MidiConvertFluidsynthJob.perform_now(f)
    end
    redirect_to userfiles_path
  end
  def delete
    p = midifile_delete_params;
    f = MidiFile.find(p[:id])
    if f.editable_for?(session[:user_id])
      f.destroy();
    else      
    end
    redirect_to userfiles_path
  end
  def change
  end
  private
  def midifile_params
    params.require(:midi_file)
        .with_defaults(public: 0)
        .permit(:midi, :song_name, :author, :public)   
  end
  def midifile_delete_params
    params.require(:midi_file)
        .permit(:id)
  end
end
