# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'zip'

DLURL           = "http://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip"
SAVEDIR         = "db/"
CSVROW_PREFNAME = 6
CSVROW_CITYNAME = 7

savePath = ""

#住所CSVダウンロード、解凍し保存

open(URI.escape(DLURL)) do |file|
    ::Zip::File.open_buffer(file.read) do |zf|
        zf.each do |entry|
            savePath = SAVEDIR + entry.name
            zf.extract(entry, savePath) { true }
        end
    end
end


#住所CSVを読み込みDBに保存
CSV.foreach(savePath, encoding: "Shift_JIS:UTF-8") do |row|
    prefName = row[CSVROW_PREFNAME]
    cityName = row[CSVROW_CITYNAME]
    pref = Prefecture.find_or_create_by(name: prefName)
    City.find_or_create_by(name: cityName, prefecture_id: pref.id)
end

File.unlink savePath