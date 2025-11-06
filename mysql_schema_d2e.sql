-- mysql_schema_d2e.sql
CREATE TABLE hourly_driver_demand (
  region VARCHAR(64),
  hour TINYINT CHECK (hour BETWEEN 0 AND 23),
  total_requests INT,
  completed_deliveries INT,
  logged_in_time_minutes INT,
  active_delivery_time_minutes INT,
  promised_eta_minutes INT,
  actual_eta_minutes INT,
  PRIMARY KEY (region, hour)
);

CREATE TABLE regions_lookup (
  region VARCHAR(64) PRIMARY KEY,
  category VARCHAR(32),
  notes VARCHAR(255)
);

CREATE TABLE incentives (
  region VARCHAR(64),
  hour TINYINT CHECK (hour BETWEEN 0 AND 23),
  incentive_multiplier DECIMAL(4,2),
  PRIMARY KEY (region, hour)
);
