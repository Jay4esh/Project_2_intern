namespace :business_partner do
  desc "Adding our business partners"
  task add_business_partner: :environment do
    20.times do
      customer_code = Faker::Alphanumeric.alpha(number: 10)
      customer_name = Faker::Name.unique.name
      corporate_number = rand(1..3000)
      invoice_number = rand(1..99999)
      postal_code = rand(1..10000)
      address = Faker::Address.unique.full_address
      telephone_number = Faker::PhoneNumber.unique.numerify('##########')
      Businesspartner.create!(customer_code:customer_code, customer_name:customer_name, corporate_number:corporate_number, invoice_number:invoice_number, postal_code:postal_code, address:address, telephone_number:telephone_number)
      end
  end
end
