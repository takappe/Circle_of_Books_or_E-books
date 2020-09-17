class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: :destroy

  def check_guest
    if resource.email == 'guest@example.com'
      redirect_to blogs_path, alert: 'ゲストユーザーは削除できません。'
    end
  end

end