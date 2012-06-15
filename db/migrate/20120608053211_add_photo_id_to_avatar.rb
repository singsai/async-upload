class AddPhotoIdToAvatar < ActiveRecord::Migration
  def change
     add_column :avatars, :photo_id, :integer
  end
end
