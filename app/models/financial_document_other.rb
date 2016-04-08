class FinancialDocumentOther < FinancialDocument
  validates :description, presence: true

  def to_label
    "#{financial_document_type.name}, archivo adjunto: #{self.file_filename}"
  end


end
