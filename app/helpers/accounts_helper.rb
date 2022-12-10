module AccountsHelper

  def profile_picture account, width = 100
    image_path = account.present? && account.image.present? ? account.image.url : "placeholder-profile.jpg"
    image_tag(image_path, width: width, class: "img-circle img-fluid m-r-5")
  end

  def profile_thumbnail account, width = 40, classes = "img-circle m-r-5"
    image_path = account.present? && account.image.present? ? account.image.thumb.url : "placeholder-profile.jpg"
    image_tag(image_path, width: width, class: classes)
  end

  def can_edit_profile? profile_id
    account_signed_in? && current_account.id == profile_id
  end

  def is_admin?
    account_signed_in? && current_account.is_admin === true
  end

end
