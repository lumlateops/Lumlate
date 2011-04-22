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
                  :image => "http://www.dot.ru/images/content/vacancy.png")
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

# Create Deals and tags
(1..5).each do |n|
  Deal.create!(:company_id => 1,
               :subscription_id => 1,
               :deal_type_id => 1,
               :title => "Test Deal #{n}",
               :description => "Test Deal description #{n}",
               :maxvalue => (1.5 + n),
               :tag_list => ['ambulance','medicine','doctor haus'],
               :expiry => (Time.now + (30 + n).days))
end

(6..10).each do |n|
  Deal.create!(:company_id => 2,
               :subscription_id => 2,
               :deal_type_id => 1,
               :title => "Test Deal #{n}",
               :description => "Test Deal description #{n}",
               :maxvalue => (1.5 + n),
               :tag_list => ['school','children','kids'],
               :expiry => (Time.now + (30 + n).days))
end

(11..15).each do |n|
  Deal.create!(:company_id => 3,
               :subscription_id => 3,
               :deal_type_id => 1,
               :title => "Test Deal #{n}",
               :description => "Test Deal description #{n}",
               :maxvalue => (1.5 + n),
               :tag_list => ['madonna','music','beatles'],
               :expiry => (Time.now + (30 + n).days))
end

(16..20).each do |n|
  Deal.create!(:company_id => 4,
               :subscription_id => 4,
               :deal_type_id => 1,
               :title => "Test Deal #{n}",
               :description => "Test Deal description #{n}",
               :maxvalue => (1.5 + n),
               :tag_list => ['box','tayson','luis'],
               :expiry => (Time.now + (30 + n).days))
end

(21..25).each do |n|
  Deal.create!(:company_id => 5,
               :subscription_id => 5,
               :deal_type_id => 1,
               :title => "Test Deal #{n}",
               :description => "Test Deal description #{n}",
               :maxvalue => (1.5 + n),
               :tag_list => ['basketball','sports','football'],
               :expiry => (Time.now + (30 + n).days))
end

(26..30).each do |n|
  Deal.create!(:company_id => 6,
               :subscription_id => 6,
               :deal_type_id => 1,
               :title => "Test Deal #{n}",
               :description => "Test Deal description #{n}",
               :maxvalue => (1.5 + n),
               :tag_list => ['movie','comedy','drama'],
               :expiry => (Time.now + (30 + n).days))
end

(31..35).each do |n|
  Deal.create!(:company_id => 7,
               :subscription_id => 7,
               :deal_type_id => 1,
               :title => "Test Deal #{n}",
               :description => "Test Deal description #{n}",
               :maxvalue => (1.5 + n),
               :tag_list => ['actors','actreess','theathre'],
               :expiry => (Time.now + (30 + n).days))
end

(36..40).each do |n|
  Deal.create!(:company_id => 8,
               :subscription_id => 8,
               :deal_type_id => 1,
               :title => "Test Deal #{n}",
               :description => "Test Deal description #{n}",
               :maxvalue => (1.5 + n),
               :tag_list => ['dance','club','dj'],
               :expiry => (Time.now + (30 + n).days))
end

(41..45).each do |n|
  Deal.create!(:company_id => 9,
               :subscription_id => 9,
               :deal_type_id => 1,
               :title => "Test Deal #{n}",
               :description => "Test Deal description #{n}",
               :maxvalue => (1.5 + n),
               :tag_list => ['army','tanks','separatists'],
               :expiry => (Time.now + (30 + n).days))
end

(46..50).each do |n|
  Deal.create!(:company_id => 10,
               :subscription_id => 10,
               :deal_type_id => 1,
               :title => "Test Deal #{n}",
               :description => "Test Deal description #{n}",
               :maxvalue => (1.5 + n),
               :tag_list => ['business','politics','department'],
               :expiry => (Time.now + (30 + n).days))
end

# Create EmailType
EmailType.create!(:name => 'Deal')

# Create Emails
(1..50).each do |n|
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

