
DROP TABLE IF EXISTS payments_data
CREATE TABLE payments_data (
  date DATE,
  merchant  VARCHAR(20),
  amount DECIMAL(10, 2),
  payment_mode VARCHAR(10)
);


INSERT INTO payments_data (date, merchant, amount, payment_mode) VALUES
('2023-07-01', 'Merchant D', 100.00, 'cash'),
('2023-07-01', 'Merchant A', 100.00, 'cash'),
('2023-07-02', 'Merchant B', 50.00, 'online'),
('2023-07-03', 'Merchant C', 75.50, 'cash'),
('2023-07-04', 'Merchant A', 200.00, 'online'),
('2023-07-05', 'Merchant B', 30.00, 'cash'),
('2023-07-06', 'Merchant C', 120.75, 'online'),
('2023-07-07', 'Merchant A', 80.00, 'cash'),
('2023-07-08', 'Merchant B', 60.50, 'online'),
('2023-07-09', 'Merchant C', 150.25, 'cash'),
('2023-07-10', 'Merchant A', 90.00, 'online');

SELECT *
from
(
select merchant, payment_mode, amount
from payments_data
) as source_table
PIVOT
(
     sum(amount)
     FOR payment_mode IN (cash, online)
) as PIVOTtable