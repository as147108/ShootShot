CREATE TABLE [dbo].[tAlbumPhoto] (
    [fId]    INT            IDENTITY (1, 1) NOT NULL,
    [fAlbId] INT            NULL,
    [fName]  NVARCHAR (20)  NULL,
    [fDes]   NVARCHAR (100) NULL,
    [fCover] BIT            NULL,
    [fLike]  INT            NULL,
    [fView]  INT            NULL
);

