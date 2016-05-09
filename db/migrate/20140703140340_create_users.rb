class CreateUsers < ActiveRecord::Migration
  create_table :users do |t|
    t.string  :name
    t.integer :happiness
    t.integer :nausea
    t.integer :tickets
    t.integer :height
  end
end
