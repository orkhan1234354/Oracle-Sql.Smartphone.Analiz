select *
from ( SELECT
                    brand_name,
                    model,
                    processor_brand,
                    PRİCE,
(row_number () over (partition by PROCESSOR_BRAND order  by PRİCE desc ))as rn
from smartphone)
    where
    rn =1
    order
    by
    PRİCE
desc;--Prosessor brendi üzrə ən yüksək qiymətə sahib olan smartfonlar

------------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------
SELECT
    *
FROM
    (
        SELECT
            *
        FROM
            smartphone
        WHERE
                rating = 89
            AND has_5g = 'false'
        ORDER BY
            rating
    );  --Reytinqi ən çox olan ve 5G olmayan Telefonlar
------------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------
SELECT
    brand_name,
    model,
    price,
    (
        CASE
            WHEN price BETWEEN 0 AND 10000     THEN
                'Normal'
            WHEN price BETWEEN 10000 AND 20000 THEN
                'Orta'
            WHEN price BETWEEN 20000 AND 30000 THEN
                'Yüksək'
            WHEN price > 30000                 THEN
                'Çox Yüksək'
        END
    ) AS derece
FROM
    smartphone
ORDER BY
    price DESC; -- Telefonların qiymətlərinə görə dərəcələndirmək 
------------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------
SELECT
    *
FROM
    (
        SELECT
            *
        FROM
            smartphone
        WHERE
                rating = 89
            AND ROWNUM < 11
    )
ORDER BY
    rating; -- Maksimum reytinqli  top 10 telefonlar
------------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------
SELECT
    *
FROM
    smartphone;

SELECT
    round(avg(price))
FROM
    smartphone
WHERE
    battery_capacity > 5000; --Batereya tutumu 5000-den cox olan telefonlarin ortalama maasi
------------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------
SELECT
    *
FROM
    smartphone
WHERE
        brand_name = 'samsung'
    AND refresh_rate = 120
ORDER BY
    PRİCE;  --Samsung brandinin ekran yenileme sureti 120Hz bearaber olan telefonlarin qiymeti
 -----------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------
SELECT
    brand_name,
    round(avg(price))
FROM
    smartphone
GROUP BY
    brand_name
ORDER BY
    round(avg(PRİCE)) DESC;--Branda gore ortalama qiymet 
-----------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------

SELECT
    brand_name,
    COUNT(*)
FROM
    (
        SELECT
            brand_name
        FROM
            smartphone
        WHERE
            processor_brand = 'snapdragon'
    )
GROUP BY
    brand_name
ORDER BY
    COUNT(*) DESC;
--Snapdragon prosessor və 5000 mAh+ batareya ilə Xiaomi modelləri üstünlük təşkil edir
-----------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------
SELECT
    *
FROM
    smartphone
WHERE
    refresh_rate > 120
ORDER BY
    refresh_rate DESC,
    PRİCE DESC;
-----------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------
/*ASUS-un ROG Phone modelləri ən yüksək yenilənmə tezliyinə (refresh rate) malikdirlər
amma Leitz - in Leitz Phone 2 modeli siyahımızda liderdir (240Hz) */
SELECT
    resolution_height,
    resolution_width,
    COUNT(*)
FROM
    smartphone
WHERE
    resolution_width = 1080
GROUP BY
    resolution_height,
    resolution_width
ORDER BY
    COUNT(*) DESC; -- 1080 ene malik 

SELECT
    resolution_height,
    resolution_width,
    COUNT(*)
FROM
    smartphone
WHERE
    resolution_height = 2400
GROUP BY
    resolution_height,
    resolution_width
ORDER BY
    COUNT(*) DESC; -- 2400 uzunluga malik
 -----------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------
SELECT
    brand_name,
    model,
    price,
    primary_camera_front,
    primary_camera_rear
FROM
    smartphone
WHERE
        resolution_height = 2400
    AND resolution_width = 1080
GROUP BY
    brand_name,
    model,
    PRİCE,
    primary_camera_front,
    primary_camera_rear
ORDER BY
    primary_camera_rear DESC,
    primary_camera_front DESC,
    price DESC;
/*Snapdragon prosessorlu və 1080x2400 ekranlı telefonlar arasında ən yüksək
 kamera göstəricilərinə Motorola və Xiaomi modelləri sahibdir*/


 -----------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------
