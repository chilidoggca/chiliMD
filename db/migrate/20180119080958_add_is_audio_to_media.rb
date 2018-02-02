class AddIsAudioToMedia < ActiveRecord::Migration[5.1]
  def change
    add_column :media, :is_audio, :boolean, null: false, default: false
  end
end
