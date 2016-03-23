class CreateFinDocTypesChapters < ActiveRecord::Migration
  def change
    create_table :fin_doc_types_chapters, id: false do |t|
      t.belongs_to :financial_document_type, index: true
      t.belongs_to :chapter, index: true
    end
  end
end
