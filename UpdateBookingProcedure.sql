DELIMITER //
CREATE PROCEDURE UpdateBooking(booking_id INT, booking_date DATE)
BEGIN
UPDATE bookings SET BookingDate = booking_date WHERE BookingID = booking_id;
SELECT CONCAT("Booking ", booking_id, " updated.") AS Confirmation;
END //
DELIMITER ;
CALL UpdateBooking(9, "2022-12-12");

