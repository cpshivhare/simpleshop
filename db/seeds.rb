class Seed
  class << self
    def create_data
      1..5.times.each do
        region = create_region_data
        puts "Region #{region.title} data sucessfully created!"
      end

      puts "\n ----------------------------"
      user = FactoryBot.create(:user)
      puts "User successfully created! Email: #{user.email} Password: password"
      puts "\n ----------------------------"

      admin = FactoryBot.create(:admin)
      puts "Admin successfully created! Email: #{admin.email} Password: password"
      puts "\n"
      puts "Data has been created! \u{1F64F}"
    end

    def create_region_data
      region = FactoryBot.create(:region)
      FactoryBot.create_list(:product, 3, region: region)

      region
    end
  end
end

if User.exists?
  puts 'Data is alreay exists!'
  puts "\n Do you want to remove old data and create new data press yes/no"
  if $stdin.gets.chomp == 'yes'
    Rake::Task['db:reset'].invoke
    Seed.create_data
  end
else
  Seed.create_data
end

