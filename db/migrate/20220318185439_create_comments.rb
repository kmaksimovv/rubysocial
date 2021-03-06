class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :post, null: false, foreign_key: true
      t.integer :parent_id
      t.string :body

      t.timestamps
    end
  end
end
