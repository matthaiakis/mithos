class CreateHomeSlides < ActiveRecord::Migration

  def self.up
    create_table :home_slides do |t|
      t.string :title
      t.text :body
      t.integer :photo_id
      t.string :link
      t.boolean :enabled
      t.integer :position

      t.timestamps
    end

    add_index :home_slides, :id

    load(Rails.root.join('db', 'seeds', 'home_slides.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "Homepage Slides"})
    end

    Page.find_all_by_link_url("/home_slides").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/home_slides"})

    drop_table :home_slides

    if defined?(Page)
      Page.delete_all({:link_url => "/home_slides"})
    end

    drop_table :home_slides
  end

end
