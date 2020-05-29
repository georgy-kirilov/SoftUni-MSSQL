-- Problem 9 - Peaks in Rila

use [Geography];

select 
	Mountains.MountainRange, 
	Peaks.PeakName, 
	Peaks.Elevation
	from Mountains
	inner join Peaks on Peaks.MountainId = Mountains.Id
	where MountainRange = 'Rila'
	order by Peaks.Elevation desc;