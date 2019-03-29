require 'csv'

namespace :csv_parser do
  desc "Parse CSV and store in db"
  task load_user_info: :environment do
    file = ARGV[1] || Rails.root.join('app/data/users.csv')
    CSV.foreach(file, headers: true) do |row|
      User.create!(row.to_h)
    end
  end
end
