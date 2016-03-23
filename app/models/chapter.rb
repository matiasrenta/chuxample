class Chapter < ActiveRecord::Base
  has_and_belongs_to_many :financial_document_types, join_table: 'fin_doc_types_chapters'
end
