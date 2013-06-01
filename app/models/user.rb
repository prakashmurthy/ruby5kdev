class User < ActiveRecord::Base
  extend OmniauthCallbacks

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
    elsif github_id
      "#{github_display_name}"
    else
      email
    end
  end

  def to_s
    "#{display_name} (#{admin? ? "Admin" : "User"})"
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    full_name_parts = full_name.split(" ")
    self.last_name = full_name_parts.pop
    self.first_name = full_name_parts.join(" ")
    self.first_name = nil if first_name.empty?
  end

  def self.find_by_name(name)
    name_parts = name.split( " " )
    user = User.find_by_first_name( name_parts[0] )
    user if user && user.last_name == name_parts[1]
  end

end
