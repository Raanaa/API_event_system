# Simple API for Room Booking Task
## Business Scenario

We are an event management system that needs to reserve rooms for our attendees during our events. We hav agreement with a hotel to reserve a set number of rooms on specific dates for our events. We will manage these through our platform, where attendees will have accounts and can select the dates they want to attend and bo room. In the event of cancellations, the dates will become available again for other attendees to book.
## User Story:
As an event attendee,
I want to book a room for the event dates through the event management platform.
So that I can easily secure my accommodation for the duration of the event.
## Acceptance Criteria:
1. Booking Creation:
* Given I am a registered attendee on the event management platform,
* When I select my desired event dates.
* Then I should be able to book a room for those dates if available.
2. Booking Cancellation:
* Given I have previously booked a room for an event,
* When I decide to cancel my booking,
* Then the booking should be canceled, and the room should become available again for those dates.
3. Viewing Booking Information:
* Given I am a registered attendee on the event management platform.
* When I navigate to my profile or booking section.
* Then I should see all my bookings formatted as reservation data, showing details of my booked dates and accommodation


## Technical Aspects:
* The application has three models:
1. User
2. Room
3. Booking
* Booking belongs to the user and room.
* The room has an available_dates attribute, which stores an array of dates when the room is free to be booked. F example, [2024-10-10". "2024-10-11"] means the room is available on these two days.
* Booking has a booking_dates attribute, which stores an array of dates that the customer booked. For example: [*2024-10-10". "2024-10-11"] that means the booking dates start from "2024-10-10" and end at "2024-10-11" and th is one night only.
* The system should ensure the integrity of the booking process, checking for room availability for the requested dates before confirming a booking.
* The security of user data and transactional information during the booking and cancellation processes must be a priority, ensuring compliance with data protection standards.
* The system must handle concurrency gracefully, preventing double bookings for the same room and dates.
* Developers are encouraged to make assumptions about any ambiguous requirements, documenting these assumptions in their code comments or documentation.
## The Submission:
You need to copy the code file to a ruby project, write your code there, and upload your project as a zip file at the end of the task.
We need to implement three endpoints:
* Create new booking
* Cancel booking
* Get the user's booking formatted using the reservations_data method in the user model.