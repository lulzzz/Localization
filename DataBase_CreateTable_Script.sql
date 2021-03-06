USE [LocalizationTest]
GO
/****** Object:  Schema [Localization]    Script Date: 5/21/2018 12:23:19 AM ******/
CREATE SCHEMA [Localization]
GO
/****** Object:  Table [Localization].[Language]    Script Date: 5/21/2018 12:23:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Localization].[Language](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CultureName] [nvarchar](255) NOT NULL,
	[DisplayName] [nvarchar](255) NOT NULL,
	[Country] [nvarchar](255) NOT NULL,
	[Region] [nvarchar](255) NOT NULL,
	[IsDefaultLanguage] [bit] NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Localization].[Resource]    Script Date: 5/21/2018 12:23:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Localization].[Resource](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[LanguageId] [bigint] NOT NULL,
	[Key] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Localization].[Resource]  WITH CHECK ADD  CONSTRAINT [FK_Resource_LanguageId_Language_Id] FOREIGN KEY([LanguageId])
REFERENCES [Localization].[Language] ([Id])
GO
ALTER TABLE [Localization].[Resource] CHECK CONSTRAINT [FK_Resource_LanguageId_Language_Id]
GO
