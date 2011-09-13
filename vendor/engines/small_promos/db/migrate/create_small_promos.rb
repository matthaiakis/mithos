class CreateSmallPromos < ActiveRecord::Migration

  def self.up
    create_table :small_promos do |t|
      t.string :title
      t.integer :icon_id
      t.integer :position
      t.text :body
      t.boolean :enabled
      t.string :link
      t.integer :position

      t.timestamps
    end

    add_index :small_promos, :id

    load(Rails.root.join('db', 'seeds', 'small_promos.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "small_promos"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/small_promos"})
    end

    drop_table :small_promos
  end

end
