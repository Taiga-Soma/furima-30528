class SnsCredential < ApplicationRecord
  belongs_to :user, optional: true  #パスワードの入力不要
end
