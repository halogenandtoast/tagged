ActiveRecord::Base.configurations = {'sqlite3' => {:adapter => 'sqlite3', :database => ':memory:'}}
ActiveRecord::Base.establish_connection('sqlite3')
ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.logger.level = Logger::WARN

class CreateSchema < ActiveRecord::Migration
  def self.up
    create_table :taggings do |t|
      t.belongs_to :tagged, :polymorphic => true
      t.belongs_to :tag
      t.datetime :created_at
    end
 
    create_table :tags do |t|
      t.string :name
    end
    create_table :posts do |t|
      t.string :title, :default => ''
    end
  end  
end

CreateSchema.suppress_messages do
  CreateSchema.migrate(:up)
end
 
class Post < ActiveRecord::Base
  tagged
end