/* ===============================
   DATA UNDERSTANDING
   =============================== */

-- 1. Cek jumlah total data
SELECT COUNT(*) AS total_data
FROM coffee_sales;

-- 2. Cek missing values
SELECT *
FROM coffee_sales
WHERE money IS NULL
   OR coffee_name IS NULL
   OR Date IS NULL;

-- 3. Cek rentang nilai transaksi
SELECT 
    MIN(money) AS min_transaksi,
    MAX(money) AS max_transaksi,
    AVG(money) AS rata_rata_transaksi
FROM coffee_sales;


/* ===============================
   ANALISIS DASAR PENJUALAN
   =============================== */

-- 4. Produk dengan jumlah penjualan terbanyak
SELECT coffee_name,
       COUNT(*) AS total_transaksi
FROM coffee_sales
GROUP BY coffee_name
ORDER BY total_transaksi DESC;

-- 5. Total pendapatan harian
SELECT Date,
       SUM(money) AS total_pendapatan
FROM coffee_sales
GROUP BY Date
ORDER BY Date;

-- 6. Produk dengan total pendapatan tertinggi
SELECT coffee_name,
       SUM(money) AS total_pendapatan
FROM coffee_sales
GROUP BY coffee_name
ORDER BY total_pendapatan DESC;

-- 7. Rata-rata nilai transaksi per hari
SELECT Date,
       AVG(money) AS rata_rata_transaksi
FROM coffee_sales
GROUP BY Date
ORDER BY Date;

-- 8. Pola jam penjualan (jam paling ramai)
SELECT hour_of_day,
       COUNT(*) AS total_transaksi
FROM coffee_sales
GROUP BY hour_of_day
ORDER BY total_transaksi DESC;

-- 9. Tren penjualan berdasarkan hari dalam seminggu
SELECT Weekday,
       SUM(money) AS total_pendapatan
FROM coffee_sales
GROUP BY Weekday
ORDER BY total_pendapatan DESC;


/* ===============================
   ANALISIS LANJUTAN
   GROUP BY & HAVING
   =============================== */

-- 10. Hari dengan jumlah transaksi lebih dari 100
SELECT Date,
       COUNT(*) AS total_transaksi
FROM coffee_sales
GROUP BY Date
HAVING COUNT(*) > 100
ORDER BY total_transaksi DESC;

-- 11. Produk dengan total pendapatan di atas rata-rata
SELECT coffee_name,
       SUM(money) AS total_pendapatan
FROM coffee_sales
GROUP BY coffee_name
HAVING SUM(money) >
       (SELECT AVG(money) FROM coffee_sales)
ORDER BY total_pendapatan DESC;
