# frozen_string_literal: true

class ImportForAgsk
  attr_reader :file, :user

  def initialize(file, user)
    @file = file
    @user = user
  end
  
  # This method imported data from Agsk table
  def import
    sheet = open_spreadsheet(@file)
    header = sheet.row(1).map(&:downcase)
    
    (2..sheet.last_row).each do |i|
      row = [header, sheet.row(i)].transpose.to_h
 
      row.map do |key, value|
        value = true if value == 1
      end

      Agsk.find_or_create_by(requirement: row.first[1]) do |agsk|
        agsk.attributes = row
        agsk.user_id = @user.id
      end
    end
  end

  # This method open file if supported format
  def open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::Csv.new(file.path)
    when '.xls' then Roo::Excel.new(file.path)
    when '.xlsx' then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end