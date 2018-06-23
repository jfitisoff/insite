require_relative 'support/spec_helper'
require_relative 'support/ruby_lang_site'

describe "https://www.ruby-lang.org" do
  before(:all) { @s = new_session }
  after(:all)  { @s.close }

  let(:s) { @s }

  it "shows 4 news posts on the landing page" do
    expect(s.home_page.posts.length).to be >= 4
  end

  xit "has a link to the News page in the header bar links" do
    expect(s.home_page.page_header.news_link.present?).to eq(true)
  end

  xit "drills down to the News page via the header bar" do
    s.home_page.page_header.news
    expect(s.news_page?).to eq(true)
  end

  xit "has a link to the News page in the footer bar links" do
    expect(s.home_page.page_footer.news_link.present?).to eq(true)
  end

  xit "drills down to the News page via the footer bar" do
    s.home_page.page_footer.news
    expect(s.news_page?).to eq(true)
  end

  it "has same title for most recent post as the news page does" do
    home_page_title = s.home_page.posts[0].post_title
    news_page_title = s.news_page.posts[0].post_title
    expect(home_page_title).to eq(news_page_title)
  end

  xit "drills down on the most recent post summary" do
    s.home_page.posts[0].continue_reading
    expect(s.news_post_page?).to eq(true)
  end
end
