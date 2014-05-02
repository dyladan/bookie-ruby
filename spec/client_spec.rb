require "bookie/client"

describe Bookie::Client do
  before :all do
    @bookie = Bookie::Client.new rc = "bookierc"
  end

  it "should be of type Bookie::Client" do
    expect(@bookie).to be_an_instance_of(Bookie::Client)
  end

  it "should load config" do
    bookie = Bookie::Client.new "bookierc"
    expect(bookie.config).to be_an_instance_of(Hash)
  end

  it "should load username" do
    expect(@bookie.config['username']).to eq("dyladan")
  end

  it "should load api key" do
    expect(@bookie.config['api_key']).to eq("12345678")
  end

  it "should load api url" do
    expect(@bookie.config['api_url']).to eq("https://bmark.us/api/v1")
  end

  describe "::get_by_user" do
    before :all do
      @bmarks = @bookie.get_by_user("dyladan", 5)
      @history = @bookie.get_by_user("dyladan", 2, 2)
    end

    it "should return an Array of correct length" do
      expect(@bmarks).to be_an_instance_of(Array)
      expect(@bmarks.length).to eq(5)
    end

    it "should return a valid url" do
      expect(@bmarks[0].url).to match(/(?:https?:\/\/).+/)
    end

    it "tags should be a list of hashes" do
      expect(@bmarks[0].tags[0]).to be_an_instance_of(Hash)
    end

    it "should return bookmarks from history" do
      expect(@history).to be_an_instance_of(Array)
      expect(@history.length).to eq(2)
      expect(@history[0]).to eq(@bmarks[1])
      expect(@history[1]).to eq(@bmarks[2])
    end
  end

  describe "::search" do
    it "should return [] on invalid input" do
      empty_list = @bookie.search []
      type_error = @bookie.search 1
      no_args = @bookie.search

      expect(empty_list).to eq([])
      expect(type_error).to eq([])
      expect(no_args).to eq([])
    end

    it "should return an array of bmarks" do
      bmarks = @bookie.search ["coroutines"]
      expect(bmarks).to be_an_instance_of(Array)
      expect(bmarks[0]).to be_an_instance_of(Bookie::Bmark)
      expect(bmarks.length).to be > 0
    end
  end
end