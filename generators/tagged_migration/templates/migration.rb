class CreateTagged < ActiveRecord::Migration
  def self.up
    create_table :taggings do |t|
      t.belongs_to :tagged, :polymorphic => true
      t.belongs_to :tag
      t.datetime :created_at
    end
 
    create_table :tags do |t|
      t.string :name
    end
    
    add_index :tags, :name
    add_index :taggings, :tag_id
    add_index :taggings, [:taggable_id, :taggable_type]
    
  end
 
  def self.down
    drop_table :taggings
    drop_table :tags
  end
end