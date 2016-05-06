class LeyArticulo < ActiveRecord::Base
  attachment :file, extension: %w[pdf xlx xlsx], store: 's3_ley_backend', cache: 's3_ley_cache'
  validates :codigo, :name, :descripcion_de_documento, :periodo_actualizacion, :detalle, presence: true

  after_destroy :remove_file_attached

  private

  def remove_file_attached
    file.try(:delete)
  end
end
