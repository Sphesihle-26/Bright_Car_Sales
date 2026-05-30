SELECT year,
       make,
       model,
       trim,
       body,
       transmission,
       vin,
       state,
       condition,
       odometer,
       color,
       interior,
       seller,
       mmr,
       sellingprice,
       
    saledate,

    TRY_TO_TIMESTAMP(
        regexp_replace(saledate,'^[A-Za-z]{3} ',''),
        'MMM dd yyyy HH:mm:ss'
    ) AS sale_timestamp,
case
WHEN DAYNAME(sale_timestamp) IN ('Sun', 'Sat') THEN 'Weekend'
     ELSE 'Weekday'
END AS Day_classification,
      DAYNAME(sale_timestamp) AS Day_name,
      MONTHNAME(sale_timestamp) AS Month_name
FROM brightmotors.case_study.car_sales_clean
GROUP BY year, model, make, trim, condition, body, transmission, vin, state, odometer, color, interior, seller, 
sellingprice,  saledate, mmr;
