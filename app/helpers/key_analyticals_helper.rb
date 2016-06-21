module KeyAnalyticalsHelper
  def infer_status_from_version(version)
    if version.event == 'destroy'
      KeyAnalytical.status_array[2] # Eliminacion
    else
      version.changeset.key?('autorizado') ? KeyAnalytical.status_array[0] : KeyAnalytical.status_array[1] # 'Afectación' : 'Modificación'
    end

  end
end
