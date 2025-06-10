

SELECT
  AssignedOfficer,
  COUNT(*) AS TotalDonors,
  COUNT(CASE WHEN LastContactDate >= DATEADD(DAY, -90, GETDATE()) THEN 1 END) AS ContactedLast90,
  ROUND(
    COUNT(CASE WHEN LastContactDate >= DATEADD(DAY, -90, GETDATE()) THEN 1 END) * 100.0 / COUNT(*),
    2
  ) AS PercentContacted
FROM donor_db.DonorPortfolio
GROUP BY AssignedOfficer;



-- top 10 donors


SELECT TOP 10 DonorName, TotalGifts 
FROM donor_db.DonorPortfolio 
ORDER BY TotalGifts DESC;


-- average gift by officer

SELECT 
  AssignedOfficer,
  AVG(TotalGifts) AS AvgGift
FROM donor_db.DonorPortfolio
GROUP BY AssignedOfficer;


-- gift over time (time series)

SELECT 
    YEAR(LastContactDate) AS Year,
    SUM(TotalGifts) AS AnnualDonations
FROM donor_db.DonorPortfolio
WHERE LastContactDate IS NOT NULL
GROUP BY Year
ORDER BY Year;