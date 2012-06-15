class AddNotesToAvatar < ActiveRecord::Migration
  def change
    add_column :avatars, :notes, :text
  end
end
