--TERM PROJECT ITERATION 6 
--ALANA AHART


--Drop sequences and tables 

DROP SEQUENCE RiderSeq;

DROP SEQUENCE TripSeq;

DROP SEQUENCE PaymentSeq;

DROP SEQUENCE BikeSeq;

DROP SEQUENCE StationSeq;

DROP SEQUENCE WeatherSeq;

DROP SEQUENCE SeasonSeq;

DROP SEQUENCE HolidaySeq;
DROP  SEQUENCE BikeStatusChangeSeq; 

DROP TABLE Trip; 

DROP TABLE Rider; 

DROP TABLE Credit; 

DROP TABLE Debit;

DROP TABLE Payment; 

DROP TABLE EBike; 

DROP TABLE StandardBike; 

DROP TABLE Bike; 
DROP TABLE Station; 

DROP TABLE Holiday;

DROP TABLE Season; 

DROP TABLE Weather; 
DROP TABLE BikeStatusChange; 
DROP TABLE BikeStatus;

--TABLES

CREATE TABLE Rider(
    RiderID DECIMAL(12) NOT NULL PRIMARY KEY,
    RiderEmail VARCHAR(100) NOT NULL,
    RiderFirstName VARCHAR(64) NOT NULL, 
    RiderLastName VARCHAR(64) Not NULL,
    RiderAge INT 
);

CREATE TABLE Payment(
    PayID DECIMAL(12) NOT NULL PRIMARY KEY, 
    Amount DECIMAL(6,2) NOT NULL, 
    PaymentTime TIMESTAMP NOT NULL,
    PaymentType VARCHAR(20) NOT NULL
);

CREATE TABLE Credit (
    PayID DECIMAL(12) PRIMARY KEY,
    CardType VARCHAR(64),
    FOREIGN KEY (PayID) REFERENCES Payment(PayID)
);

CREATE TABLE Debit (
    PayID DECIMAL(12) PRIMARY KEY,
    BankName VARCHAR(64),
    FOREIGN KEY (PayID) REFERENCES Payment(PayID)
);


CREATE TABLE Station (
    StationID DECIMAL(12) NOT NULL PRIMARY KEY, 
    StationName VARCHAR(100) NOT NULL, 
    StationLatitude DECIMAL(9,6) NOT NULL, 
    StationLongitude DECIMAL(9,6) NOT NULL 
);

CREATE TABLE Bike (
    BikeID DECIMAL(12) NOT NULL PRIMARY KEY,
    StationID DECIMAL(12),
    BikeType VARCHAR(64) NOT NULL, 
    BikeModel VARCHAR(64) NOT NULL,
    BikeYear INT NOT NULL,
    BikeMake VARCHAR(64) NOT NULL,
    FOREIGN KEY (StationID) REFERENCES Station(StationID)
);

CREATE TABLE EBike (
    BikeID DECIMAL(12) PRIMARY KEY NOT NULL,
    FOREIGN KEY (BikeID) REFERENCES Bike(BikeID)
);

    
CREATE TABLE StandardBike (
    BikeID DECIMAL(12) PRIMARY KEY NOT NULL,
    FOREIGN KEY(BikeID) REFERENCES Bike(BikeID) 
);

CREATE TABLE Holiday (
    HolidayID DECIMAL(12) NOT NULL PRIMARY KEY
);

CREATE TABLE Season (
    SeasonID DECIMAL(12) NOT NULL PRIMARY KEY 
);

CREATE TABLE Weather (
    WeatherID DECIMAL(12) NOT NULL PRIMARY KEY,
    Precipitation DECIMAL(4,2) NULL, 
    WindSpeed INT NUll, 
    Temperature DECIMAL(5,2) NULL
);

CREATE TABLE Trip (
    TripID DECIMAL(12) NOT NULL PRIMARY KEY,
    TripDuration INT NOT NULL, 
    StartTime TIMESTAMP NOT NULL,
    EndTime TIMESTAMP NOT NULL,
    BikeID DECIMAL(12),
    HolidayID DECIMAL(12),
    StartStationID DECIMAL(12),
    EndStationID DECIMAL(12),
    RiderID DECIMAL(12),
    SeasonID DECIMAL(12),
    WeatherID DECIMAL(12),
    PayID DECIMAL(12),
    FOREIGN KEY (BikeID) REFERENCES Bike(BikeID),
    FOREIGN KEY (HolidayID) REFERENCES Holiday(HolidayID),
    FOREIGN KEY (StartStationID) REFERENCES Station(StationID),
    FOREIGN KEY (EndStationID) REFERENCES Station(StationID),
    FOREIGN KEY (RiderID) REFERENCES Rider(RiderID),
    FOREIGN KEY (SeasonID) REFERENCES Season(SeasonID),
    FOREIGN KEY (WeatherID) REFERENCES Weather(WeatherID),
    FOREIGN KEY (PayID) REFERENCES Payment(PayID)
);

    

--SEQUENCES



CREATE SEQUENCE RiderSeq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE TripSeq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE PaymentSeq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE BikeSeq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE StationSeq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE WeatherSeq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE SeasonSeq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE HolidaySeq START WITH 1 INCREMENT BY 1;

--There are over 100 bike stations in Bergen and this table would be a domain lookup table. 
INSERT INTO Station (StationID, StationName, StationLatitude, StationLongitude)
VALUES (StationSeq.nextval, 'Kong Oscars gate', 60.393323, 5.330654);

INSERT INTO Station (StationID, StationName, StationLatitude, StationLongitude)
VALUES (StationSeq.nextval, 'John Lunds plass', 60.388247, 5.324558);

INSERT INTO Station (StationID, StationName, StationLatitude, StationLongitude)
VALUES (StationSeq.nextval, 'Skur 11', 60.396384, 5.324164);

INSERT INTO Station (StationID, StationName, StationLatitude, StationLongitude)
VALUES (StationSeq.nextval, 'Solheimsgaten (ved Extra)', 60.375145, 5.338517);

INSERT INTO Station (StationID, StationName, StationLatitude, StationLongitude)
VALUES (StationSeq.nextval, 'Kode 1',   60.390642, 5.324397);

INSERT INTO Station (StationID, StationName, StationLatitude, StationLongitude)
VALUES (StationSeq.nextval, 'Krohnviken', 60.378107, 5.331208);

INSERT INTO Station (StationID, StationName, StationLatitude, StationLongitude)
VALUES (StationSeq.nextval, 'Nykirken', 60.396949, 5.313495);

INSERT INTO Station (StationID, StationName, StationLatitude, StationLongitude)
VALUES (StationSeq.nextval, 'Håkonsgaten', 60.391185, 5.318026);

INSERT INTO Station (StationID, StationName, StationLatitude, StationLongitude)
VALUES (StationSeq.nextval, 'Moxy Hotellet', 60.378828, 5.333327);

INSERT INTO Station (StationID, StationName, StationLatitude, StationLongitude)
VALUES (StationSeq.nextval, 'Busstasjonen 3 Øst', 60.387856, 5.334460);

INSERT INTO Station (StationID, StationName, StationLatitude, StationLongitude)
VALUES (StationSeq.nextval, 'Lars Hilles', 60.388118, 5.331487);

INSERT INTO Station (StationID, StationName, StationLatitude, StationLongitude)
VALUES (StationSeq.nextval, 'Småstrandgaten', 60.393098, 5.327072);

INSERT INTO Station (StationID, StationName, StationLatitude, StationLongitude)
VALUES (StationSeq.nextval, 'Møllendalsplass',60.379687, 5.351994);

INSERT INTO Station (StationID, StationName, StationLatitude, StationLongitude)
VALUES (StationSeq.nextval, 'Solheimsviken', 60.377882, 5.335575);

INSERT INTO Station (StationID, StationName, StationLatitude, StationLongitude)
VALUES (StationSeq.nextval, 'Laksevåg senter',60.389632, 5.286516);


--Stored procedure for new account 
CREATE OR REPLACE PROCEDURE add_rider_account (
  p_first_name  IN  VARCHAR,
  p_last_name   IN  VARCHAR,
  p_email       IN  VARCHAR,
  p_age         IN  NUMBER,
  p_rider_id    OUT NUMBER
) IS
BEGIN
  
  p_rider_id := RiderSeq.nextval;

  INSERT INTO Rider (
    RiderID,
    RiderFirstName,
    RiderLastName,
    RiderEmail,
    RiderAge
  ) VALUES (
    p_rider_id,
    p_first_name,
    p_last_name,
    p_email,
    p_age
  );

  COMMIT;
END add_rider_account;
/

--5 Entries for rider account 

DECLARE
  v_rider_id NUMBER;
BEGIN
  add_rider_account(
    p_first_name => 'Michael',
    p_last_name  => 'Johnson',
    p_email      => 'michael.johnson@example.com',
    p_age        => 34,
    p_rider_id   => v_rider_id
  );

  add_rider_account(
    p_first_name => 'Emily',
    p_last_name  => 'Davis',
    p_email      => 'emily.davis@example.com',
    p_age        => 27,
    p_rider_id   => v_rider_id
  );

  add_rider_account(
    p_first_name => 'Daniel',
    p_last_name  => 'Martinez',
    p_email      => 'daniel.martinez@example.com',
    p_age        => 45,
    p_rider_id   => v_rider_id
  );

  add_rider_account(
    p_first_name => 'Olivia',
    p_last_name  => 'Wilson',
    p_email      => 'olivia.wilson@example.com',
    p_age        => 31,
    p_rider_id   => v_rider_id
  );

  add_rider_account(
    p_first_name => 'James',
    p_last_name  => 'Anderson',
    p_email      => 'james.anderson@example.com',
    p_age        => 22,
    p_rider_id   => v_rider_id
  );

  COMMIT;
END;
/

-- Stored procedure for payment use case 

CREATE OR REPLACE PROCEDURE record_payment (
  p_amount       IN NUMBER,            
  p_payment_time IN TIMESTAMP,         
  p_payment_type IN VARCHAR,          
  p_card_type    IN VARCHAR DEFAULT NULL, 
  p_bank_name    IN VARCHAR DEFAULT NULL, 
  p_pay_id       OUT NUMBER             
) IS
BEGIN

  p_pay_id := PaymentSeq.nextval;

  INSERT INTO Payment (PayID, Amount, PaymentTime, PaymentType)
  VALUES (p_pay_id, p_amount, p_payment_time, p_payment_type);

  IF UPPER(p_payment_type) = 'CREDIT' THEN
    IF p_card_type IS NULL THEN
      RAISE_APPLICATION_ERROR(-20001, 'Card type is required for credit payments');
    END IF;
    INSERT INTO Credit (PayID, CardType)
    VALUES (p_pay_id, p_card_type);

  ELSIF UPPER(p_payment_type) = 'DEBIT' THEN
    IF p_bank_name IS NULL THEN
      RAISE_APPLICATION_ERROR(-20002, 'Bank name is required for debit payments');
    END IF;
    INSERT INTO Debit (PayID, BankName)
    VALUES (p_pay_id, p_bank_name);

  ELSE
    RAISE_APPLICATION_ERROR(-20003, 'Unknown payment type: ' || p_payment_type);
  END IF;

  COMMIT;
END record_payment;
/



--insert 5 entries for payment 
DECLARE
  v_pay_id NUMBER;
BEGIN
  
  record_payment(120.50, SYSTIMESTAMP, 'Credit','Visa', NULL,v_pay_id);
 
  record_payment( 35.75, SYSTIMESTAMP, 'Debit',  NULL, 'First National', v_pay_id);
 
  record_payment( 89.99, SYSTIMESTAMP, 'Credit', 'MasterCard', NULL, v_pay_id);
  
  record_payment( 47.20, SYSTIMESTAMP, 'Debit', NULL,'Community Bank', v_pay_id);
 
  record_payment(150.00, SYSTIMESTAMP, 'Credit', 'Amex',  NULL, v_pay_id);

  COMMIT;
END;
/

--insert statements for bike table 


INSERT INTO Bike (BikeID, StationID, BikeType, BikeModel, BikeYear, BikeMake)
VALUES (BikeSeq.nextval, 1, 'Standard', 'S1-Mountain', 2022, 'Trek');
INSERT INTO StandardBike (BikeID)
VALUES (BikeSeq.currval);

INSERT INTO Bike (BikeID, StationID, BikeType, BikeModel, BikeYear, BikeMake)
VALUES (BikeSeq.nextval, 1, 'Standard', 'S2-Road',     2023, 'Giant');
INSERT INTO StandardBike (BikeID)
VALUES (BikeSeq.currval);

INSERT INTO Bike (BikeID, StationID, BikeType, BikeModel, BikeYear, BikeMake)
VALUES (BikeSeq.nextval, 1, 'Standard', 'S3-Hybrid',  2021, 'Cannondale');
INSERT INTO StandardBike (BikeID)
VALUES (BikeSeq.currval);

INSERT INTO Bike (BikeID, StationID, BikeType, BikeModel, BikeYear, BikeMake)
VALUES (BikeSeq.nextval, 1, 'Standard', 'S4-Urban',   2020, 'Specialized');
INSERT INTO StandardBike (BikeID)
VALUES (BikeSeq.currval);

INSERT INTO Bike (BikeID, StationID, BikeType, BikeModel, BikeYear, BikeMake)
VALUES (BikeSeq.nextval, 1, 'Standard', 'S5-Comfort', 2019, 'Schwinn');
INSERT INTO StandardBike (BikeID)
VALUES (BikeSeq.currval);

INSERT INTO Bike (BikeID, StationID, BikeType, BikeModel, BikeYear, BikeMake)
VALUES (BikeSeq.nextval, 1, 'EBike', 'E1-City',    2023, 'RadPower');
INSERT INTO EBike (BikeID)
VALUES (BikeSeq.currval);

INSERT INTO Bike (BikeID, StationID, BikeType, BikeModel, BikeYear, BikeMake)
VALUES (BikeSeq.nextval, 1, 'EBike', 'E2-Trail',   2022, 'Aventon');
INSERT INTO EBike (BikeID)
VALUES (BikeSeq.currval);

INSERT INTO Bike (BikeID, StationID, BikeType, BikeModel, BikeYear, BikeMake)
VALUES (BikeSeq.nextval, 1, 'EBike', 'E3-Utility', 2021, 'Lectric');
INSERT INTO EBike (BikeID)
VALUES (BikeSeq.currval);

INSERT INTO Bike (BikeID, StationID, BikeType, BikeModel, BikeYear, BikeMake)
VALUES (BikeSeq.nextval, 1, 'EBike', 'E4-Compact', 2020, 'VanMoof');
INSERT INTO EBike (BikeID)
VALUES (BikeSeq.currval);

INSERT INTO Bike (BikeID, StationID, BikeType, BikeModel, BikeYear, BikeMake)
VALUES (BikeSeq.nextval, 1, 'EBike', 'E5-Cargo',   2019, 'Gazelle');
INSERT INTO EBike (BikeID)
VALUES (BikeSeq.currval);

COMMIT;


--altered season table to add the season name
--season is a domain/lookup table. All possible values are given ahead of time


ALTER TABLE Season
ADD (SeasonName VARCHAR(20) NOT NULL);
INSERT INTO Season (SeasonID, SeasonName)
VALUES (SeasonSeq.nextval, 'Spring');

INSERT INTO Season (SeasonID, SeasonName)
VALUES (SeasonSeq.nextval, 'Summer');

INSERT INTO Season (SeasonID, SeasonName)
VALUES (SeasonSeq.nextval, 'Fall');

INSERT INTO Season (SeasonID, SeasonName)
VALUES (SeasonSeq.nextval, 'Winter');

COMMIT;

INSERT INTO Weather (WeatherID, Precipitation, WindSpeed, Temperature) 
VALUES (WeatherSeq.nextval, 0.0, 2, -1.8);

INSERT INTO Weather (WeatherID, Precipitation, WindSpeed, Temperature) 
VALUES (WeatherSeq.nextval, 2.1, 3, 5.6);

INSERT INTO Weather (WeatherID, Precipitation, WindSpeed, Temperature) 
VALUES (WeatherSeq.nextval, 0.0, 2, -2.3);

INSERT INTO Weather (WeatherID, Precipitation, WindSpeed, Temperature) 
VALUES (WeatherSeq.nextval, 5.7, 7, 12.8);

INSERT INTO Weather (WeatherID, Precipitation, WindSpeed, Temperature) 
VALUES (WeatherSeq.nextval, 0.3, 5,  0.0);

INSERT INTO Weather (WeatherID, Precipitation, WindSpeed, Temperature) 
VALUES (WeatherSeq.nextval,10.2, 6, 19.1);

INSERT INTO Weather (WeatherID, Precipitation, WindSpeed, Temperature) 
VALUES (WeatherSeq.nextval, 1.5, 3,  3.7);

INSERT INTO Weather (WeatherID, Precipitation, WindSpeed, Temperature) 
VALUES (WeatherSeq.nextval, 0.0, 1, -3.3);

INSERT INTO Weather (WeatherID, Precipitation, WindSpeed, Temperature) 
VALUES (WeatherSeq.nextval, 6.9, 5, 14.6);

INSERT INTO Weather (WeatherID, Precipitation, WindSpeed, Temperature) 
VALUES (WeatherSeq.nextval, 0.0, 1,  7.2);

COMMIT;



INSERT INTO Trip (
  TripID,
  TripDuration,
  StartTime,
  EndTime,
  BikeID,
  HolidayID,
  StartStationID,
  EndStationID,
  RiderID,
  SeasonID,
  WeatherID,
  PayID
) VALUES (
  TripSeq.nextval,
  32,
  TIMESTAMP '2025-06-01 09:15:00',
  TIMESTAMP '2025-06-01 09:47:00',
  3,      
  NULL,   
  2,      
  5,      
  4,      
  2,      
  7,      
  1       
);

INSERT INTO Trip (
  TripID, TripDuration, StartTime, EndTime,
  BikeID, HolidayID, StartStationID, EndStationID,
  RiderID, SeasonID, WeatherID, PayID
) VALUES (
  TripSeq.nextval,
  45,
  TIMESTAMP '2025-06-02 14:30:00',
  TIMESTAMP '2025-06-02 15:15:00',
  7, NULL,  8, 12,
  2, 2, 3,  2
);

INSERT INTO Trip (
  TripID, TripDuration, StartTime, EndTime,
  BikeID, HolidayID, StartStationID, EndStationID,
  RiderID, SeasonID, WeatherID, PayID
) VALUES (
  TripSeq.nextval,
  18,
  TIMESTAMP '2025-06-03 07:50:00',
  TIMESTAMP '2025-06-03 08:08:00',
  1, NULL,  10, 4,
  5, 2,  1,  3
);

INSERT INTO Trip (
  TripID, TripDuration, StartTime, EndTime,
  BikeID, HolidayID, StartStationID, EndStationID,
  RiderID, SeasonID, WeatherID, PayID
) VALUES (
  TripSeq.nextval,
  60,
  TIMESTAMP '2025-06-04 18:00:00',
  TIMESTAMP '2025-06-04 19:00:00',
  10, NULL, 10, 12,
  5, 2,   3,   4
);

INSERT INTO Trip (
  TripID, TripDuration, StartTime, EndTime,
  BikeID, HolidayID, StartStationID, EndStationID,
  RiderID, SeasonID, WeatherID, PayID
) VALUES (
  TripSeq.nextval,
  25,
  TIMESTAMP '2025-06-05 12:10:00',
  TIMESTAMP '2025-06-05 12:35:00',
  5, NULL,  3,  7,
  1, 2,  5,   5
);

COMMIT;

-- Question 1: Which riders took trips on e-bikes, including their names, trip duration, weather conditions, and the season of the trip? 
SELECT
  r.RiderFirstName,
  r.RiderLastName,
  t.TripDuration,
  w.Precipitation,
  w.WindSpeed,
  w.Temperature,
  s.SeasonName
FROM Trip t
  JOIN EBike eb  ON t.BikeID = eb.BikeID
  JOIN Rider r ON t.RiderID = r.RiderID
  JOIN Weather w ON t.WeatherID = w.WeatherID
  JOIN Season s ON t.SeasonID    = s.SeasonID
ORDER BY r.RiderLastName, t.TripDuration;


--Question 2: Which type of riders (standard bike or e-bike users) tend to use credit or debit cards more often for their trips? 
SELECT
  b.BikeType,
  p.PaymentType,
  COUNT(*) AS TripCount
FROM Trip t
JOIN Bike b    ON t.BikeID = b.BikeID
JOIN Payment p ON t.PayID  = p.PayID
GROUP BY
  b.BikeType,
  p.PaymentType
ORDER BY
  b.BikeType,
  TripCount DESC;

--Question 3: How many trips were taken in the last week, how much revenue was generated, and how does that break down by payment type?

CREATE OR REPLACE VIEW last_week_trip AS
SELECT
  t.TripID,
  t.StartTime,
  p.PaymentType,
  p.Amount
FROM Trip t
JOIN Payment p
  ON t.PayID = p.PayID
WHERE t.StartTime >= SYSTIMESTAMP - INTERVAL '7' DAY;
SELECT
  COUNT(*)    AS TotalTrips,
  SUM(Amount) AS TotalRevenue
FROM last_week_trip;
SELECT
  PaymentType,
  COUNT(*)    AS Trips,
  SUM(Amount) AS Revenue
FROM last_week_trip
GROUP BY PaymentType
ORDER BY Revenue DESC;

--index for FK 

CREATE INDEX idx_trip_bikeid
  ON Trip(BikeID);
CREATE INDEX idx_trip_holidayid
  ON Trip(HolidayID);
CREATE INDEX idx_trip_startstationid
  ON Trip(StartStationID);
CREATE INDEX idx_trip_endstationid
  ON Trip(EndStationID);
CREATE INDEX idx_trip_riderid
  ON Trip(RiderID);
CREATE INDEX idx_trip_seasonid
  ON Trip(SeasonID);
CREATE INDEX idx_trip_weatherid
  ON Trip(WeatherID);
CREATE INDEX idx_trip_payid
  ON Trip(PayID);

--query index 

CREATE INDEX idx_trip_starttime
  ON Trip(StartTime);
  
CREATE INDEX idx_bike_biketype
  ON Bike(BikeType);
  
CREATE INDEX idx_payment_paymenttype
  ON Payment(PaymentType);
  
--create new table bike status 
--bikes can now be identified as active, maintenance, or retired 
  
CREATE TABLE BikeStatus (
  StatusID   DECIMAL(3) NOT NULL PRIMARY KEY,
  StatusName VARCHAR2(20) NOT NULL
);
INSERT INTO BikeStatus (StatusID, StatusName) VALUES (1, 'Active');
INSERT INTO BikeStatus (StatusID, StatusName) VALUES (2, 'Maintenance');
INSERT INTO BikeStatus (StatusID, StatusName) VALUES (3, 'Retired');
COMMIT;

--Adding the status to all bikes for the current data 
ALTER TABLE Bike
ADD (
  StatusID DECIMAL(3) DEFAULT 1 NOT NULL,
  CONSTRAINT fk_bike_status
    FOREIGN KEY (StatusID)
    REFERENCES BikeStatus(StatusID)
);


--History Table to track bike status changes 
CREATE TABLE BikeStatusChange (
  BikeStatusChangeID DECIMAL(12) NOT NULL PRIMARY KEY,
  BikeID  DECIMAL(12) NOT NULL,
  OldStatusID DECIMAL(3) NOT NULL,
  NewStatusID DECIMAL(3) NOT NULL,
  ChangeDate  TIMESTAMP NOT NULL,
  ChangedBy VARCHAR2(100) NULL,
  FOREIGN KEY (BikeID) REFERENCES Bike(BikeID),
  FOREIGN KEY (OldStatusID) REFERENCES BikeStatus(StatusID),
  FOREIGN KEY (NewStatusID) REFERENCES BikeStatus(StatusID)
);

--Sequence for bke status change 
CREATE SEQUENCE BikeStatusChangeSeq START WITH 1 INCREMENT BY 1;


--Trigger for bike status change 
CREATE OR REPLACE TRIGGER BikeStatusChangeTrigger
BEFORE UPDATE OF StatusID ON Bike
FOR EACH ROW
BEGIN
  IF :OLD.StatusID <> :NEW.StatusID THEN
    INSERT INTO BikeStatusChange (
      BikeStatusChangeID,  
      BikeID,             
      OldStatusID,         
      NewStatusID,         
      ChangeDate,          
      ChangedBy          
    ) VALUES (
      BikeStatusChangeSeq.nextval,
      :OLD.BikeID,
      :OLD.StatusID,
      :NEW.StatusID,
      SYSTIMESTAMP,      
      USER              
    );
  END IF;
END;
/

SELECT * 
FROM Bike;

SELECT * 
FROM BikeStatus;
  
UPDATE Bike
   SET StatusID = 2
 WHERE BikeID = 1;
COMMIT;

UPDATE Bike
   SET StatusID = 1
 WHERE BikeID   = 1;
COMMIT;


SELECT *
FROM BikeStatusChange; 

  

INSERT INTO Bike (BikeID, StationID, BikeType, BikeModel, BikeYear, BikeMake, StatusID)
VALUES (BikeSeq.nextval,  2, 'Standard', 'S6-GranFondo', 2021, 'Trek',     1);
INSERT INTO Bike (BikeID, StationID, BikeType, BikeModel, BikeYear, BikeMake, StatusID)
VALUES (BikeSeq.nextval,  5, 'EBike',    'E6-CityPro',   2022, 'RadPower',1);
INSERT INTO Bike (BikeID, StationID, BikeType, BikeModel, BikeYear, BikeMake, StatusID)
VALUES (BikeSeq.nextval,  3, 'Standard', 'S7-Cross',     2020, 'Giant',    1);
INSERT INTO Bike (BikeID, StationID, BikeType, BikeModel, BikeYear, BikeMake, StatusID)
VALUES (BikeSeq.nextval,  4, 'EBike',    'E7-UrbanX',    2021, 'Aventon',  1);
INSERT INTO Bike (BikeID, StationID, BikeType, BikeModel, BikeYear, BikeMake, StatusID)
VALUES (BikeSeq.nextval,  6, 'Standard', 'S8-Speedster', 2019, 'Specialized',1);
COMMIT;

INSERT INTO BikeStatusChange
  (BikeStatusChangeID, BikeID, OldStatusID, NewStatusID, ChangeDate, ChangedBy)
VALUES
  (BikeStatusChangeSeq.nextval, 11, 1, 2,
   TO_TIMESTAMP('2025-01-02 08:15:00','YYYY-MM-DD HH24:MI:SS'), 'ADMIN');
INSERT INTO BikeStatusChange
  (BikeStatusChangeID, BikeID, OldStatusID, NewStatusID, ChangeDate, ChangedBy)
VALUES
  (BikeStatusChangeSeq.nextval, 11, 2, 1,
   TO_TIMESTAMP('2025-01-06 10:30:00','YYYY-MM-DD HH24:MI:SS'), 'MAINT_USER');
INSERT INTO BikeStatusChange
  (BikeStatusChangeID, BikeID, OldStatusID, NewStatusID, ChangeDate, ChangedBy)
VALUES
  (BikeStatusChangeSeq.nextval, 11, 1, 3,
   TO_TIMESTAMP('2025-05-15 16:45:00','YYYY-MM-DD HH24:MI:SS'), 'ADMIN');

INSERT INTO BikeStatusChange
  (BikeStatusChangeID, BikeID, OldStatusID, NewStatusID, ChangeDate, ChangedBy)
VALUES
  (BikeStatusChangeSeq.nextval, 12, 1, 2,
   TO_TIMESTAMP('2025-02-10 09:00:00','YYYY-MM-DD HH24:MI:SS'), 'ADMIN');
INSERT INTO BikeStatusChange
  (BikeStatusChangeID, BikeID, OldStatusID, NewStatusID, ChangeDate, ChangedBy)
VALUES
  (BikeStatusChangeSeq.nextval, 12, 2, 1,
   TO_TIMESTAMP('2025-02-14 14:20:00','YYYY-MM-DD HH24:MI:SS'), 'MAINT_USER');
INSERT INTO BikeStatusChange
  (BikeStatusChangeID, BikeID, OldStatusID, NewStatusID, ChangeDate, ChangedBy)
VALUES
  (BikeStatusChangeSeq.nextval, 12, 1, 2,
   TO_TIMESTAMP('2025-04-01 11:05:00','YYYY-MM-DD HH24:MI:SS'), 'ADMIN');
INSERT INTO BikeStatusChange
  (BikeStatusChangeID, BikeID, OldStatusID, NewStatusID, ChangeDate, ChangedBy)
VALUES
  (BikeStatusChangeSeq.nextval, 12, 2, 1,
   TO_TIMESTAMP('2025-04-05 13:50:00','YYYY-MM-DD HH24:MI:SS'), 'MAINT_USER');
INSERT INTO BikeStatusChange
  (BikeStatusChangeID, BikeID, OldStatusID, NewStatusID, ChangeDate, ChangedBy)
VALUES
  (BikeStatusChangeSeq.nextval, 12, 1, 3,
   TO_TIMESTAMP('2025-06-10 17:30:00','YYYY-MM-DD HH24:MI:SS'), 'ADMIN');

INSERT INTO BikeStatusChange
  (BikeStatusChangeID, BikeID, OldStatusID, NewStatusID, ChangeDate, ChangedBy)
VALUES
  (BikeStatusChangeSeq.nextval, 13, 1, 2,
   TO_TIMESTAMP('2025-03-03 07:45:00','YYYY-MM-DD HH24:MI:SS'), 'ADMIN');
INSERT INTO BikeStatusChange
  (BikeStatusChangeID, BikeID, OldStatusID, NewStatusID, ChangeDate, ChangedBy)
VALUES
  (BikeStatusChangeSeq.nextval, 13, 2, 1,
   TO_TIMESTAMP('2025-03-10 12:10:00','YYYY-MM-DD HH24:MI:SS'), 'MAINT_USER');
INSERT INTO BikeStatusChange
  (BikeStatusChangeID, BikeID, OldStatusID, NewStatusID, ChangeDate, ChangedBy)
VALUES
  (BikeStatusChangeSeq.nextval, 13, 1, 3,
   TO_TIMESTAMP('2025-06-01 15:00:00','YYYY-MM-DD HH24:MI:SS'), 'ADMIN');

INSERT INTO BikeStatusChange
  (BikeStatusChangeID, BikeID, OldStatusID, NewStatusID, ChangeDate, ChangedBy)
VALUES
  (BikeStatusChangeSeq.nextval, 14, 1, 2,
   TO_TIMESTAMP('2025-04-20 10:25:00','YYYY-MM-DD HH24:MI:SS'), 'ADMIN');
INSERT INTO BikeStatusChange
  (BikeStatusChangeID, BikeID, OldStatusID, NewStatusID, ChangeDate, ChangedBy)
VALUES
  (BikeStatusChangeSeq.nextval, 14, 2, 1,
   TO_TIMESTAMP('2025-04-25 09:15:00','YYYY-MM-DD HH24:MI:SS'), 'MAINT_USER');
INSERT INTO BikeStatusChange
  (BikeStatusChangeID, BikeID, OldStatusID, NewStatusID, ChangeDate, ChangedBy)
VALUES
  (BikeStatusChangeSeq.nextval, 14, 1, 2,
   TO_TIMESTAMP('2025-05-02 14:40:00','YYYY-MM-DD HH24:MI:SS'), 'ADMIN');
INSERT INTO BikeStatusChange
  (BikeStatusChangeID, BikeID, OldStatusID, NewStatusID, ChangeDate, ChangedBy)
VALUES
  (BikeStatusChangeSeq.nextval, 14, 2, 1,
   TO_TIMESTAMP('2025-05-10 11:55:00','YYYY-MM-DD HH24:MI:SS'), 'MAINT_USER');
INSERT INTO BikeStatusChange
  (BikeStatusChangeID, BikeID, OldStatusID, NewStatusID, ChangeDate, ChangedBy)
VALUES
  (BikeStatusChangeSeq.nextval, 14, 1, 3,
   TO_TIMESTAMP('2025-06-12 16:10:00','YYYY-MM-DD HH24:MI:SS'), 'ADMIN');

INSERT INTO BikeStatusChange
  (BikeStatusChangeID, BikeID, OldStatusID, NewStatusID, ChangeDate, ChangedBy)
VALUES
  (BikeStatusChangeSeq.nextval, 15, 1, 2,
   TO_TIMESTAMP('2025-05-05 08:00:00','YYYY-MM-DD HH24:MI:SS'), 'ADMIN');
INSERT INTO BikeStatusChange
  (BikeStatusChangeID, BikeID, OldStatusID, NewStatusID, ChangeDate, ChangedBy)
VALUES
  (BikeStatusChangeSeq.nextval, 15, 2, 1,
   TO_TIMESTAMP('2025-05-12 13:30:00','YYYY-MM-DD HH24:MI:SS'), 'MAINT_USER');
COMMIT;

--maintenance count before being retired 
SELECT
  bc.BikeID,
  COUNT(*) AS maintenance_count
FROM BikeStatusChange bc
JOIN BikeStatus bs
  ON bc.NewStatusID = bs.StatusID
WHERE bs.StatusName = 'Maintenance'
  AND EXISTS (
    SELECT 1
      FROM BikeStatusChange retire
     WHERE retire.BikeID = bc.BikeID
       AND retire.NewStatusID = (
             SELECT StatusID
               FROM BikeStatus
              WHERE StatusName = 'Retired'
           )
  )
GROUP BY
  bc.BikeID
ORDER BY
  maintenance_count DESC;

--retirement count by month 
SELECT
  TO_CHAR(ChangeDate, 'YYYY-MM') AS month,
  COUNT(*) AS retire_count
FROM BikeStatusChange c
JOIN BikeStatus s 
  ON c.NewStatusID = s.StatusID
WHERE s.StatusName = 'Retired'
GROUP BY TO_CHAR(ChangeDate, 'YYYY-MM')
ORDER BY month;

