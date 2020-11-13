class ApplicationController < ActionController::Base
  #Basic認証を行う
  before_action :basic_auth
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

  #ベーシック認証を行う処理
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end
end
