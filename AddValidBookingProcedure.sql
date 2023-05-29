DELIMITER //
CREATE PROCEDURE AddValidBooking(booking_date DATE, table_number INT, customer_id INT, booking_id INT)
BEGIN
DECLARE b_date DATE;
DECLARE t_no INT;
START TRANSACTION;
SELECT BookingDate INTO b_date FROM bookings WHERE BookingDate = booking_date;
SELECT TableNo INTO t_no FROM bookings WHERE TableNo = table_number;
IF b_date = booking_date AND t_no = table_number THEN 
	SELECT CONCAT("Table ", table_number, " is already booked - booking canceled");
ROLLBACK;
ELSE	
INSERT INTO bookings (BookingID, BookingDate, TableNo, CustomerID)
	VALUES (booking_id, booking_date, table_number, customer_id);
SELECT CONCAT("Table ", table_number, " is now booked.");
COMMIT;
END IF;
END //
DELIMITER ;
CALL AddValidBooking('2022-12-17', 6, 20, 20);
DROP PROCEDURE AddValidBooking;