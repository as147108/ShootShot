CREATE TABLE [dbo].[tCMsg] (
    [fId]       INT            IDENTITY (1, 1) NOT NULL,
    [fCEmail]   NVARCHAR (50)  NULL,
    [fOrderNum] NVARCHAR (50)  NULL,
    [fMsgTime]  SMALLDATETIME  NULL,
    [fMsg]      NVARCHAR (100) NULL,
    [fState]    BIT            NULL,
    [fPEmail]   NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([fId] ASC)
);

