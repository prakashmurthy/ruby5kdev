class User < ActiveRecord::Base
  has_many :entries
  # Include default devise modules. Others available are:
  # :token_authenticatable, 
  # :lockable, :timeoutable 
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name,
                  :running_in_pune, :runner_goal, :runner_level
  # attr_accessible :title, :body

  def display_name 
    if twitter_id
      "#{twitter_display_name} (@#{twitter_screen_name})"
    else
      email
    end
  end

  def to_s
    "#{display_name} (#{admin? ? "Admin" : "User"})"
  end

  def name
    "#{first_name} #{last_name}"
  end

  def self.find_by_name(name)
    name_parts = name.split( " " )
    user = User.find_by_first_name( name_parts[0] )
    user if user && user.last_name == name_parts[1]
  end

  def self.find_or_create_for_twitter(response)
    data = response['extra']['raw_info']
    if user = User.find_by_twitter_id(data["id"].to_s)
      user
    elsif user = User.find_by_name(data["name"])
      user.twitter_id = data["id"]
      user.twitter_screen_name = data["screen_name"]
      user.twitter_display_name = data["name"]
      user
    else # Create a user with a stub password
      user = User.new(:email => "twitter+#{data["id"]}@example.com",
                      :password => Devise.friendly_token[0,20])
      user.twitter_id = data["id"]
      user.twitter_screen_name = data["screen_name"]
      user.twitter_display_name = data["name"]
      user.confirm!
      user
    end
  end
end
