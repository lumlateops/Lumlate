class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :oauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :username, :login, :to_label
  attr_accessor :login
  has_many :subscriptions, :through => :user_subscriptions
  has_many :user_subscriptions, :dependent => :destroy
  has_many :deals, :through => :emails
  has_many :emails, :dependent => :destroy
  has_many :votes

  validates :username, :presence => true, :uniqueness => true
  validates :username, :presence => true, :uniqueness => true, :length => { :maximum => 14, :minimum => 4 }

  def to_label
    username
  end

  def tags
    tags = []
    deals.map{ |d| d.tag_list.each { |t| tags << t } }
    tags.uniq
  end

  def deal_emails
    emails.select { |e| e.deal.present? }
  end

  def deal_emails_by_max_value
    deal_emails.sort { |a,b| b.deal.maxvalue <=> a.deal.maxvalue }
  end

  def deal_emails_by_min_value
    deal_emails.sort{ |a,b| a.deal.maxvalue <=> b.deal.maxvalue  }
  end

  def deal_emails_by_expiry_date
    deal_emails.sort{ |a,b| a.deal.expiry <=> b.deal.expiry  }
  end

  def deal_emails_with_expiry_date(expiry_date)
    deal_emails.select{ |e| e.deal.expiry.to_date == (expiry_date) }
  end

  def deal_emails_by_companies(companies)
    in_companies = []
    companies.each { |company| in_companies += deal_emails.select { |e| e.deal.company_id == company.to_i } }
    in_companies.uniq
  end

  def deal_emails_tagged_with(tag_list)
    tagged = []
    tag_list.each { |tag| tagged += deal_emails.select { |e| e.deal.tag_list.include?(tag) } }
    tagged.uniq
  end

  def deals_by_rating
    # There we will add method later
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = ActiveSupport::JSON.decode(access_token.get('https://graph.facebook.com/me?'))
    if user = User.find_by_email(data["email"])
      user
    else # Create an user with a stub password.
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20])
    end
  end

  protected

  def self.find_for_database_authentication(conditions)
    login = conditions.delete(:login)
    where(conditions).where(["username = :value OR email = :value", { :value => login }]).first
  end

  def self.send_reset_password_instructions(attributes={})
   recoverable = find_recoverable_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
   recoverable.send_reset_password_instructions if recoverable.persisted?
   recoverable
 end

 def self.find_recoverable_or_initialize_with_errors(required_attributes, attributes, error=:invalid)
   case_insensitive_keys.each { |k| attributes[k].try(:downcase!) }

   attributes = attributes.slice(*required_attributes)
   attributes.delete_if { |key, value| value.blank? }

   if attributes.size == required_attributes.size
     if attributes.has_key?(:login)
        login = attributes.delete(:login)
        record = find_record(login)
     else
       record = where(attributes).first
     end
   end

   unless record
     record = new

     required_attributes.each do |key|
       value = attributes[key]
       record.send("#{key}=", value)
       record.errors.add(key, value.present? ? error : :blank)
     end
   end
   record
 end

 def self.find_record(login)
   where(attributes).where(["username = :value OR email = :value", { :value => login }]).first
 end

end

