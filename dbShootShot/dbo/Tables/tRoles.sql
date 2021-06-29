CREATE TABLE [dbo].[tRoles] (
    [fId]   INT           IDENTITY (1, 1) NOT NULL,
    [fCode] INT           NULL,
    [fRole] NVARCHAR (10) NULL,
    CONSTRAINT [PK__tRoles__D9F8227C9004E43D] PRIMARY KEY CLUSTERED ([fId] ASC)
);



