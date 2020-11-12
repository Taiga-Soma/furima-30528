class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2, :line, :twitter]
          # :validatable ユーザー編集の際、passwordを毎回入力するのが面倒なので、コメントアウト

  has_many :comments
  has_many :orders
  has_one :address
  has_many :items
  has_one :card, dependent: :destroy
  has_many :comments 
  has_many :sns_credentials

  def self.from_omniauth(auth) #snsログイン機能実装
  
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
     # userが登録済みであるか判断
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  with_options presence: true do
    validates :nickname, length: { maximum: 40 }
    validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :lastname, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
    /\A[a-z0-9]+\z/
    validates :email
    validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }, on: :create
    validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }, on: :create
    # 上記をコメントアウトしたことによりemailとpasswordにvalidationが、適用されていないので追記
    # "on: create" onlyと似ていて、特定のアクションのときのみvalidationされる
  end
end
