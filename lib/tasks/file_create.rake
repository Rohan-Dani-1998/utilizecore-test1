require 'csv'
# require "#{Rails.root}/app/models/parcel"
# require 'active_record/fixtures'

desc 'Delete and Create a File'
task :file_create => :environment do
    file = "#{Rails.root}/public/courier_details.csv"
    File.delete(file) if File.exist?(file)
    parcels = Parcel.all
    headers = ["Courier Weight", "Courier Status", "Courier Service Type", "Sender", "Receiver"]
    CSV.open(file, 'w', write_headers: true, headers: headers) do |writer|
      parcels.each do |parcel|
        writer << [parcel.weight, parcel.status, parcel.service_type.name, parcel.sender.name, parcel.receiver.name]
      end
    end
end
