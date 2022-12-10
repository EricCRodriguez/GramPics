class Account < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  validates :username, presence: true, uniqueness: true
  before_validation :set_username

  def full_name
    "#{first_name} #{last_name}"
  end

  def total_followers
    Follower.where(following_id: self.id).count
  end

  def total_following
    Follower.where(follower_id: self.id).count
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      name = auth.info.name.split(" ")
      first_name = name[0]
      last_name = name.size > 1 ? name[1] : ""

      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = first_name
      user.first_name = last_name
      user.username = name.join
      user.image = auth.info.image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  private

  def set_username
    self.username = username.downcase if username.present?
  end

end
