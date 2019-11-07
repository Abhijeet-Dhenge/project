use Abhijeet_Practice
go

create Procedure ORS.JobOpening
@role varchar(max)
As
Begin
Select ORS.JobOpeningInfo.JobId,ORS.JobOpeningInfo.EmployerId,ORS.JobOpeningInfo.JobCategory,ORS.JobOpeningInfo.JobLocation,ORS.JobOpeningInfo.RequiredSkills,ORS.JobOpeningInfo.Role1,ORS.JobOpeningInfo.MinQualification,ORS.JobOpeningInfo.MaxAge,ORS.JobOpeningInfo.Salary,ORS.JobOpeningInfo.JobDescription,ORS.EmployerInfo.CompanyName 
from ORS.JobOpeningInfo Inner Join ORS.EmployerInfo On  ORS.JobOpeningInfo.EmployerId = ORS.EmployerInfo.EmployerId 
Where ORS.JobOpeningInfo.Role1 Like @role
End
go

create Procedure ORS.JobApplicantsNew
@EmployerId int
As
Begin
select ORS.JobSeekerPersInfo.FirstName,ORS.JobSeekerPersInfo.LastName,ORS.JobSeekerEducInfo.MaxQualification,
ORS.JobSeekerEducInfo.PassingYear,ORS.JobSeekerEducInfo.GraduationPercent,ORS.JobSeekerEducInfo.Skills,
ORS.JobSeekerEducInfo.WorkExperience,ORS.JobSeekerEducInfo.InstituteName
from ORS.JobSeekerEducInfo inner join ORS.JobSeekerPersInfo
on ORS.JobSeekerPersInfo.JobSeekerId = ORS.JobSeekerEducInfo.JobSeekerId
inner join ORS.JobsAppliedInfoNew on ORS.JobsAppliedInfoNew.JobSeekerId = ORS.JobSeekerEducInfo.JobSeekerId
inner join ORS.JobOpeningInfo on ORS.JobOpeningInfo.JobId = ORS.JobsAppliedInfoNew.JobId
inner join ORS.EmployerInfo on ORS.EmployerInfo.EmployerId = ORS.JobOpeningInfo.EmployerId
Where ORS.EmployerInfo.EmployerId = @EmployerId
End

Create Table ORS.JobsAppliedInfoNew
(
Id int primary key identity,
JobId integer,
JobSeekerId integer,
Status varchar(max)
);