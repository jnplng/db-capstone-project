DELIMITER //
CREATE PROCEDURE CheckBooking(booking_date DATE, table_number INT)
BEGIN
DECLARE b_date DATE;
DECLARE t_no INT;
SELECT BookingDate INTO b_date FROM Bookings WHERE BookingDate = booking_date;
SELECT TableNo INTO t_no FROM Bookings WHERE TableNo = table_number;
IF b_date = booking_date AND t_no = table_number THEN
SELECT CONCAT('Table ', table_number, ' is already booked.');
ELSE
SELECT CONCAT('Table ', table_number, ' is available.');
END IF;
END //
DELIMITER ;
CALL CheckBooking("2022-11-12", 3);

