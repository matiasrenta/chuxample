class CatFonFund < ActiveRecord::Base
  belongs_to :cat_fon_origin_resource

  belongs_to :cat_fon_year_document

  belongs_to :cat_fon_specific_source

  belongs_to :cat_fon_generic_source

  belongs_to :cat_fon_funding_source

  validates :key, :description, :cat_fon_funding_source_id, :cat_fon_generic_source_id, :cat_fon_specific_source_id, :cat_fon_year_document_id, :cat_fon_origin_resource_id, presence: true
  validates :key, uniqueness: true
end
