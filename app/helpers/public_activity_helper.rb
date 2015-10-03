module PublicActivityHelper
  def exists_class?(c)
    if Object.const_get(c.to_sym).is_a?(Class)
      return true
    end
  rescue => error
    return false
  end
end