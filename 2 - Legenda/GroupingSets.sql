--OVER -- Rows / range default where there is no Order By
Select BattleId,DateOfTransaction,COUNT(*) Over(Partition By BattleId, Year(DateOfTransaction)--DATEPART(month,DateOfTransaction)
													Order By DateOfTransaction
													Rows between unbounded preceding and current row) as Running
 from [dbo].[tbltransaction]
GO

--Range  default where there is a Order By
Select BattleId,DateOfTransaction,COUNT(*) Over(Partition By BattleId, Year(DateOfTransaction)--DATEPART(month,DateOfTransaction)
													Order By DateOfTransaction
													range between unbounded preceding and unbounded following) as Running
 from [dbo].[tbltransaction]
GO

--OVER -- Rows / range default where there is no Order By
Select BattleId,DateOfTransaction,
ROW_NUMBER() Over(Order By BattleId, DateOfTransaction) as TheRowNumberFile
 from [dbo].[tbltransaction]
GO


--OVER -- Rows / range default where there is no Order By
Select BattleId,DateOfTransaction,
ROW_NUMBER() Over(partition By BattleId Order By BattleId, DateOfTransaction) as TheRowNumberFile
 from [dbo].[tbltransaction]
GO


-- First Value
Select BattleId,DateOfTransaction,
FIRST_VALUE(BattleId)
Over(partition By BattleId Order By DateOfTransaction) as FisrtMonth
 from [dbo].[tbltransaction]
GO

CREATE TABLE HeroTraining (
Id int Not Null identity(1,1) Primary key,
HeroId int Not null,
DateTrainig date,
HourTraining int
CONSTRAINT fk_Heros FOREIGN KEY (HeroId) REFERENCES [dbo].[Heros] (id)
)

INSERT INTO HeroTraining Values('1','20220201','66'),('1','20220301','92'),('1','20220401','91'),('1','20220501','15'),('1','20220601','81'),('1','20220701','78'),
                               ('1','20220801','45'),('1','20220901','85'),('1','20221001','45'),('1','20221101','87'),('1','20221201','89'),('1','20220201','51')




Select * from HeroTraining


-- First Value and Last Value
Select HeroId,DateTrainig,
FIRST_VALUE(HourTraining)
Over(partition By HeroId Order By DateTrainig) as FirstMonth,
LAST_VALUE(HourTraining)
Over(partition By HeroId Order By DateTrainig) as LastMounth
 from [dbo].HeroTraining
GO

-- Lag -Lead
Select HeroId,DateTrainig,HourTraining,
Lag(HourTraining,1)
Over(partition By HeroId Order By DateTrainig) as MyLag,
lEAD(HourTraining,1)
Over(partition By HeroId Order By DateTrainig) as MyLead,
HourTraining - Lag(HourTraining,1)
Over(partition By HeroId Order By DateTrainig) as MyDifferebce
 from [dbo].HeroTraining
GO
