# Creating Test data

# Create basic Accounts
Account.create!(:subdomain => 'lumlate')
Account.create!(:subdomain => 'oauthwork')

# Create User
(1..10).each do |n|
  User.create!(:email => "testuser#{n}@example.com",
               :username => "Test User #{n}",
               :password => '12345678',
               :password_confirmation => '12345678')
end

# Create Companies
(1..10).each do |n|
  Company.create!(:name => "test_company_#{n}",
                  :domain => "testcompany#{n}.com",
                  :image => "http://example.com/images/image#{n}.jpeg")
end

# Create Locations for Companies
(1..10).each do |n|
  Location.create!(:company_id => n,
                   :state => "New York #{n}",
                   :city => "New York #{n}",
                   :zipcode=> "1253#{n}",
                   :address => "26#{n} Elizabet Street")
end

# Create SubscriptionType
SubscriptionType.create!(:name => 'test_type_1')

# Create SubscriptionStatus
SubscriptionStatus.create!(:name => 'subscription_status_1')

# Create Subscriptions for Companies and Users
(1..10).each do |n|
  Subscription.create!(:company_id => n,
                       :subscription_type_id => 1,
                       :title => "subscription_#{n}",
                       :url => "http://example.com/subcriptions/#{n}",
                       :email_domain => "email#{n}.com",
                       :domain => "example#{n}.com",
                       :form_data => '',
                       :submit_method => '')
end

# Create UserSubscriptions

(1..10).each do |n|
  UserSubscription.create!(:user_id => 1, :subscription_id => n, :subscription_status_id => 1)
end

# Create DealType
DealType.create!(:name => 'test_deal_type_1')

# Create Deals
(1..10).each do |n|
  Deal.create!(:company_id => 1,
               :subscription_id => 1,
               :deal_type_id => 1,
               :title => "Test Deal #{n}",
               :description => "Test Deal description #{n}",
               :maxvalue => (1.5 + n),
               :expiry => (Time.now + (30 + n).days))
end

# Create EmailType
EmailType.create!(:name => 'Deal')

# Create Emails
(1..10).each do |n|
  Email.create!(:user_id => 1,
                :subscription_id => 1,
                :deal_id => n,
                :email_type_id => 1,
                :external_id => "123#{n}",
                :subject => "Test Subject #{n}",
                :userdata => "Test user data #{n}",
                :content => "Test content #{n}",
                :from => "from#{n}@email.com",
                :to => "testuser1@example.com",
                :fromname => "Test FromName #{n}",
                :sent => Time.now - n.minute,
                :recieved => Time.now + n.hour)
end

