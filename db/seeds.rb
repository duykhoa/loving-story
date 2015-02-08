# create fake data env for development
unless Rails.env.production?
  20.times do
    FactoryGirl.create(:service_order)
  end
end

# create default_admin user
AdminUser.create(
  email: 'admin@tenluaweb.info',
  password: '12345678'
)

# dynamic text in home page
settings = 
  [ 
    { key: 'header_intro',
      value: 'Keep your love story 4ever on'
    },
    { key: 'header_title',
      value: 'TenLuaWeb'
    },
    { key: 'first_feature_title',
      value: 'Feature 1'
    },
    { key: 'second_feature_title',
      value: 'Feature 2'
    },
    { key: 'third_feature_title',
      value: 'Feature 3'
    },
    { key: 'fourth_feature_title',
      value: 'Feature 4'
    },
    { key: 'templates_choosing_title',
      value: 'Most popular templates'
    },
    { key: 'commitment_title',
      value: 'Commitment'
    },
    { key: 'follow_title',
      value: 'Follow Us'
    }
  ]

settings.each do |setting|
  Setting.create(key: setting[:key], value: setting[:value])
end

%w(First Second Third Fourth).each do |i|
  FactoryGirl.create(:setting, key: "#{i}_feature_content")
end

FactoryGirl.create(:setting, key: 'Follow_intro')
