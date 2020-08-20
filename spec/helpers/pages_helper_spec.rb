require 'rails_helper'

RSpec.describe PagesHelper, :type => :helper do

  context "get informative time" do
    it "return date format" do
      time = Time.now - 3.days
      expect(helper.get_informative_time(time)).to(
        eq "at #{time.strftime("%Y/%m/%d")}"
      )
    end

    it "return informative message" do
      time = Time.now - 1.hour
      expect(helper.get_informative_time(time)).to(
        eq "#{time_ago_in_words(time)} ago"
      )
    end
  end
end