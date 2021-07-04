CREATE TABLE [dbo].[tProject] (
    [fId]         INT             IDENTITY (1, 1) NOT NULL,
    [fOrderNum]   NVARCHAR (50)   NULL,
    [fPjtDate]    DATETIME        NULL,
    [fCEmail]     NVARCHAR (50)   NULL,
    [fContact]    NVARCHAR (30)   NULL,
    [fContactTel] NVARCHAR (20)   NULL,
    [fWkdyTime]   NVARCHAR (10)   NULL,
    [fWkndTime]   NVARCHAR (10)   NULL,
    [fCity]       NVARCHAR (10)   NULL,
    [fLoc]        NVARCHAR (10)   NULL,
    [fFilmDate]   DATE            NULL,
    [fFilmTime]   TIME (0)        NULL,
    [fBudget]     INT             NULL,
    [fPrintQty]   INT             NULL,
    [fPjtTopic]   NVARCHAR (20)   NULL,
    [fReq]        NVARCHAR (1024) NULL,
    [fStyle]      NVARCHAR (100)  NULL,
    [fPjtState]   BIT             NULL,
    [fPEmail]     NVARCHAR (50)   NULL,
    PRIMARY KEY CLUSTERED ([fId] ASC)
);



