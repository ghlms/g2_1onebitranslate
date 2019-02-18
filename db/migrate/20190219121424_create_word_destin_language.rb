class CreateWordDestinLanguage < ActiveRecord::Migration[5.2]
  def change
    create_table :word_destin_languages do |t|
      t.string :language
      t.string :word
    end
  end
end
