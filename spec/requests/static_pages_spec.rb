require 'spec_helper'

describe "Static pages" do

  # let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  subject { page }

  describe "Home page" do
    before { visit root_path }

    # it "should have the h1 'Sample App'" do
      # visit '/static_pages/home'
      # visit root_path
      # page.should have_content('Sample App')
      # page.should have_selector('h1', text: 'Sample App')
    # end

    # it "should have the base title" do
      # page.should have_selector('title', text: "#{base_title}")
    # end

    # it "should not have a custom page title" do
      # page.should_not have_selector('title', text: '| Home')
    # end

    # it { should have_selector 'title', text: "#{base_title}" }

    it { should have_selector 'h1',    text: 'Sample App' }
    it { should have_selector 'title', text: full_title('') }
    it { should_not have_selector 'title', text: '| Home'}
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector 'h1',    text: 'Help' }
    it { should have_selector 'title', text: full_title('Help') }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector 'h1',    text: 'About' }
    it { should have_selector 'title', text: full_title('About Us') }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector 'h1',    text: 'Contact' }
    it { should have_selector 'title', text: full_title('Contact') }
  end
end
