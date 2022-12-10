class Accounts::RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    if resource.provider == "facebook"
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end
end
