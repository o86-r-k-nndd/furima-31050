class ApplicationController < ActionController::Base
  #deviseのコントローラーの処理を実行する前にメソッドの処理を行う
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  #サインアップ時deviseで用いるparamsのデータにUserモデルのカラムを追加する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
                                                        :nickname,
                                                        :first_name,
                                                        :first_name_kana,
                                                        :last_name,
                                                        :last_name_kana,
                                                        :birthday
                                                      ])
  end
end
