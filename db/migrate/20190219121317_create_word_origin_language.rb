class CreateWordOriginLanguage < ActiveRecord::Migration[5.2]
  def change
    create_table :word_origin_languages do |t|
      t.string :language
      t.string :word
    end
  end
end
