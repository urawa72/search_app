namespace :es do
  desc "インデックス作成・データインポート"
  task create_import: :environment do
    Book.create_index!
    Book.import_record
  end
end
