module Admin::StoresHelper

  def yes_no(bool)
    bool == true ? "Да" : "Нет"
  end
end
