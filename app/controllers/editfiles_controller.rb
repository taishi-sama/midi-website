class EditfilesController < ApplicationController
    def get
        @midifile = MidiFile.find(params[:midi_file_id])
        puts @midifile
    end
    def post
        p = midifile_params
        puts p
        p2 = p.except(:id)
        puts p2
        f = MidiFile.find(p[:id])
        unless f.update(p2)
            flash[:error] = f.errors.full_messages;
        end
        redirect_to userfiles_path
    end
    private
    def midifile_params
        params.require(:midifile)
            .with_defaults(public: 0).permit(:public, :song_name, :author, :id)
            
    end
end
