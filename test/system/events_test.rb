require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h1", text: "Events"
  end

  test "creating a Event" do
    visit events_url
    click_on "New Event"

    fill_in "Date", with: @event.date
    fill_in "Description", with: @event.description
    fill_in "Epigraph", with: @event.epigraph
    fill_in "Hour", with: @event.hour
    fill_in "Title", with: @event.title
    fill_in "To Date", with: @event.to_date
    fill_in "Url", with: @event.url
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "updating a Event" do
    visit events_url
    click_on "Edit", match: :first

    fill_in "Date", with: @event.date
    fill_in "Description", with: @event.description
    fill_in "Epigraph", with: @event.epigraph
    fill_in "Hour", with: @event.hour
    fill_in "Title", with: @event.title
    fill_in "To Date", with: @event.to_date
    fill_in "Url", with: @event.url
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "destroying a Event" do
    visit events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event was successfully destroyed"
  end
end