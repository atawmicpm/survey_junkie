class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  
    create_table :surveys do |t|
      t.references :user
      t.string :name
      t.timestamps
    end

    create_table :questions do |t|
      t.references :survey
      t.text :name
      t.string :type
      t.timestamps
    end

    create_table :choices do |t|
      t.references :question
      t.string :name
      t.timestamps
    end

    create_table :answers do |t|
      t.references :user
      t.references :choice
      t.timestamps
    end
  end
end
