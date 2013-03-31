require 'spec_helper'

describe "Static pages" do

  # let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  subject { page }

  shared_examples_for "All static pages" do
    it { should have_selector 'h1',    text: heading }
    it { should have_selector 'title', text: full_title(page_title) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    {'Sample App'}
    let(:page_title) {''}

=begin
    # Replaced by the it variant method
    it "should have the h1 'Sample App'" do
      visit '/static_pages/home'
      visit root_path
      page.should have_content('Sample App')
      page.should have_selector('h1', text: 'Sample App')
    end

    it "should have the base title" do
      page.should have_selector('title', text: "#{base_title}")
    end

    it "should not have a custom page title" do
      page.should_not have_selector('title', text: '| Home')
    end
=end

=begin
    # Replaced by spec/support/utilities.rb full_title method
    it { should have_selector 'title', text: "#{base_title}" }
=end

=begin
    # Replaced by shared_examples_for
    it { should have_selector 'h1',    text: 'Sample App' }
    it { should have_selector 'title', text: full_title('') }
=end

    it_should_behave_like "All static pages"
    it { should_not have_selector 'title', text: '| Home'}
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading)    {'Help'}
    let(:page_title) {'Help'}

    it_should_behave_like "All static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading)    {'About'}
    let(:page_title) {'About Us'}

    it_should_behave_like "All static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading)    {'Contact'}
    let(:page_title) {'Contact'}

    it_should_behave_like "All static pages"
  end

  it "should have the right links on the layout" do
    visit root_path

    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')

    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')

    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')

    click_link "Home"
    page.should have_selector 'title', text: full_title('')

    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign Up')

    click_link "sample app"
    page.should have_selector 'title', text: full_title('')
  end
end
