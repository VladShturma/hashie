module CommonMethods
  def get_method_name(name_str)
    name_str[0, name_str.length - 1].to_sym
  end
end