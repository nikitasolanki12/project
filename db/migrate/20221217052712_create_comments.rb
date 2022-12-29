# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :post
      t.references :user
      t.text :description

      t.timestamps
    end
  end
end
