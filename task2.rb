puts "helo"
require 'pdf/reader'
require 'google_drive'
require 'pry'
require 'Date'
#require 'google-apis-drive_v3'

def download
    session = GoogleDrive::Session.from_service_account_key("credentials.json")
    folder = session.file_by_id("1v8kAzirygnGsKm4X0eX_OhNgFPw865aQ")
    folder.files.each_with_index do |file|
        file_name = file.title
        p file_name
        file.download_to_file("files/#{file_name.split.join("_")}")
    end
end

def parser
    if !@document.select{|e| e.include? "Judgment for Costs of"}.empty?
        date_ = Date.strptime("#{@document.select{|e| e.include? "Date of Notice:"}[0].split[-1]}", "%m/%d/%Y").to_date
        state = "State" + @document[0].split("State")[-1]
        amount = @document.select{|e| e.include? "$"}[0].scan(/\$(\d+)*(,\d+)*(\.\d+)?/)[0].join("")
        petitioner = @document[1].split("Supreme")[0].strip
        data_hash = {
            date: date_,
            state: state,
            amount: amount,
            petitioner: petitioner
        }
        puts data_hash
    end

end

#download
Dir[("/Users/abdulwahab/ex_work/locallabs/files/*pdf")].each do |file_name|
    p file_name
    reader = PDF::Reader.new(open(file_name))
    @document = reader.pages.first.text.scan(/^.+/)
    parser
end
