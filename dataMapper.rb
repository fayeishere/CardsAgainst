configure :development, :production do
  set :datamapper_url, "sqlite3://#{File.dirname(__FILE__)}/corkboard.sqlite3"
end
configure :test do
  set :datamapper_url, "sqlite3://#{File.dirname(__FILE__)}/corkboard-test.sqlite3"
end

DataMapper.setup(:default, settings.datamapper_url)

class Data
  include DataMapper::Resource

  # Data.property(:id, Serial)
  # Data.property(:subject, Text, :required => true)
  Data.property(:nums, Text, :required => true)
  Data.property(:created_at, DateTime)
  Data.property(:updated_at, DateTime)

  # def to_json(*a)
  #  {
  #     'id'      => self.id,
  #     'subject' => self.subject,
  #     'content' => self.content,
  #     'date'    => self.updated_at
  #  }.to_json(*a)
  # end
end