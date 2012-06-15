class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.string :avatar_file

      t.timestamps
    end
  end
end
