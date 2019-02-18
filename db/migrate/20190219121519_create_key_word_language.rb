class CreateKeyWordLanguage < ActiveRecord::Migration[5.2]
  def change
    create_table :key_word_languages do |t|
      t.integer :word_origin_language_id
      t.integer :word_destin_language_id
    end
  end
end
