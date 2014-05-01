require "bookie/bmark"

describe Bookie::Bmark do
  before :all do
    @hash = {"username"=>"dyladan", "updated"=>"2014-04-29 14:08:43", "extended"=>"", "description"=>"Google", "tags"=>[{"tid"=>891, "name"=>"search"}], "url"=>"https://www.google.com/", "bid"=>142454, "total_clicks"=>9, "stored"=>"2014-04-29 14:06:34", "inserted_by"=>"chrome_ext", "tag_str"=>"search", "clicks"=>1, "hash_id"=>"d0e196a0c25d35"}
    @bookie = Bookie::Bmark.new @hash
  end

  it "should be of type Bookie::Bmark" do
    expect(@bookie).to be_an_instance_of(Bookie::Bmark)
  end

  it "should export url" do
    expect(@bookie.url).to eq("https://www.google.com/")
  end

  it "should export description" do
    expect(@bookie.description).to eq("Google")
  end

  it "should export hash_id" do
    expect(@bookie.hash_id).to eq("d0e196a0c25d35")
  end

  it "should export username" do
    expect(@bookie.username).to eq("dyladan")
  end

  it "should export time stored" do
    expect(@bookie.stored).to eq("2014-04-29 14:06:34")
  end

  it "should export time updated" do
    expect(@bookie.updated).to eq("2014-04-29 14:08:43")
  end

  it "should implement equality" do
    bmark = Bookie::Bmark.new @hash
    expect(bmark).to eq(@bookie)
  end
end