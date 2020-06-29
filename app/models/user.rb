class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable
  devise :database_authenticatable, :rememberable, :validatable, :trackable, :lockable

  validate :validate_only_one

  private
  def validate_only_one
    errors.add(:base, "There can be only one!") if User.count >= 1
  end
end