module PublicActivityHelper
  def exists_class?(c)
    if Object.const_get(c.to_sym).is_a?(Class)
      return true
    end
  rescue => error
    return false
  end

  def trackables
    all_trackables = PublicActivity::Activity.select(:trackable_type).group(:trackable_type).order(:trackable_type).map(&:trackable_type)
    existing_trackables = Array.new
    all_trackables.each {|t| existing_trackables << t if exists_class?(t)}
    opt = Array.new
    existing_trackables.each do |t|
      opt << OpenStruct.new(id: t, name: t("activerecord.models.#{t.underscore}.one"))
    end
    opt
  end

  def keyables
    [['Creó', 'create'], ['Actualizó', 'update'], ['Borró', 'destroy']]
  end
end