CREATE TABLE [dbo].[tMember] (
    [fId]       INT           IDENTITY (1, 1) NOT NULL,
    [fName]     NVARCHAR (30) NULL,
    [fPhoto]    NVARCHAR (50) NULL,
    [fBday]     DATE          NULL,
    [fEmail]    NVARCHAR (50) NULL,
    [fTel]      NVARCHAR (20) NULL,
    [fArea]     NVARCHAR (10) NULL,
    [fPassword] NVARCHAR (50) NULL,
    [fGender]   BIT           NULL,
    [fCode]     VARCHAR (1)   NULL,
    PRIMARY KEY CLUSTERED ([fId] ASC)
);

