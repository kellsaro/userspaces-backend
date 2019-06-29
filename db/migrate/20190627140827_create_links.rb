class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :url

      t.timestamps
    end

    create_join_table :links, :spaces
  end
end
