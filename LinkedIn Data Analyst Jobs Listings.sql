-- master raw data 

Select *
From [LinkedInDataAnalystJobsListings].[dbo].['linkedin-jobs-usa$']

-- to clean the data delete null values

Delete From [LinkedInDataAnalystJobsListings].[dbo].['linkedin-jobs-usa$']
Where title is null

-- To group the job title

Select TOP (10) title, COUNT(title) as Total
From [LinkedInDataAnalystJobsListings].[dbo].['linkedin-jobs-usa$']
Group by title
Order by Total desc

-- To know which company has the most listing

Select TOP (10) company, COUNT(company) as Total
From [LinkedInDataAnalystJobsListings].[dbo].['linkedin-jobs-usa$']
Group by company
Order by Total desc

-- To know the work onsite or remote

Select onsite_remote, COUNT(onsite_remote) as Total
From [LinkedInDataAnalystJobsListings].[dbo].['linkedin-jobs-usa$']
Group by onsite_remote
Order by Total desc

-- To plot the location without the abbrieviation

With CTE
as
(
Select PARSENAME(REPLACE(location, ',', '.'), 2) as State
From [LinkedInDataAnalystJobsListings].[dbo].['linkedin-jobs-usa$']
)
Select State, COUNT(State) as Total
From CTE
Where State is not null
Group by State
Order by Total desc