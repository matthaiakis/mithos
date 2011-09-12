class CreateHomeSlides < ActiveRecord::Migration

  def self.up
    create_table :home_slides do |t|
      t.text :name
      t.photo :image
      t.integer :position

      t.timestamps
    end

    add_index :home_slides, :id

    load(Rails.root.join('db', 'seeds', 'home_slides.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "home_slides"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/home_slides"})
    end

    drop_table :home_slides
  end

end
