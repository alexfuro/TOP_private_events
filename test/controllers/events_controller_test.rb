require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.first
    log_in_as(@user)
  end

  test "should get create event page" do
    get new_event_path
    assert_response :success
  end

  test "should not allow invalid event info" do
    get new_event_path
    assert_no_difference 'Event.count' do
      post events_path params: { event: { description: "",
                                          location: "",
                                          event_date: "" }}
    end
    assert_not flash.empty?
  end

  test "should allow valid event info" do
    get new_event_path
    assert_difference 'Event.count', 1 do
      post events_path params: { event: { description: "Mia's party",
                                          location: "Mia's house",
                                          event_date: Time.zone.now }}
    end
    assert_not flash.empty?
  end

  test "gets show event page" do
    @event = Event.first
    get event_path(@event)
    assert_response :success
  end
end
