
-- donors_by_segment.sql
SELECT 
    CASE
        WHEN TotalGifts > 10000 THEN 'Major Donor'
        WHEN TotalGifts > 5000 THEN 'Mid-Level'
        ELSE 'General'
    END AS Segment,
    COUNT(*) AS DonorCount,
    SUM(TotalGifts) AS TotalAmount
FROM donor_db.DonorPortfolio
GROUP BY Segment 