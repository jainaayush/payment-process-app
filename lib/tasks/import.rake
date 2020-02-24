require 'csv'

namespace :import do
  desc 'Import merchants'
  task merchants: :environment do
    merchants = []
    file = Rails.root.join('merchant_list.csv')
    CSV.foreach(file, headers: true) do |row|
      merchants << User.new(import_params(row))
    end
    User.import(merchants)
  end

  def import_params(params)
    {
      name: params['Name'],
      email: params['Email'],
      description: params['Description'],
      status: params['Status'],
      password: "#{params['Email'].split('@')[0]}pass123",
      admin_id: User.admins&.first&.id,
      role: 'merchant'
    }
  end
end
