class CreateLinks < ActiveRecord::Migration[7.2]
  def change
    create_table :links do |t|
      t.string :slug
      t.string :destination

      t.timestamps
    end
    add_index :links, :slug, unique: true
  end
end
