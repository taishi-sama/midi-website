ActiveAdmin.register MidiFile do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  #permit_params :song_name, :author, :public, :user_id, :midi, :fluidsynth
  index do 
    selectable_column
    id_column
    column :song_name
    column :author
    column :public
    column :user_id
    column "Midi" do |f|
      link_to 'Скачать', rails_blob_path(f.midi)
    end
    column "Fluidsynth Ogg" do |f|
      link_to 'Скачать', rails_blob_path(f.fluidsynth)
    end
    #attachment_column :fluidsynth
    actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:song_name, :author, :public, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
