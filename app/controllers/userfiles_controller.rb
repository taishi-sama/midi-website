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

  end
  private
  def midifile_params
    params.require(:midi_file)
        .with_defaults(public: 0)
        .permit(:midi, :song_name, :author, :public)
        
  end
end
