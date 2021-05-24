CREATE TABLE [Distribution] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(50) NOT NULL,
    [Location] nvarchar(max) NOT NULL,
    [Telephone] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_Distribution] PRIMARY KEY ([Id])
);
GO


CREATE TABLE [ProductionCompany] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(50) NOT NULL,
    [Logo] nvarchar(max) NOT NULL,
    [AnnualRevenue] Money NOT NULL,
    [EstablishmentDate] Date NOT NULL,
    CONSTRAINT [PK_ProductionCompany] PRIMARY KEY ([Id])
);
GO


CREATE TABLE [Movie] (
    [Id] int NOT NULL IDENTITY,
    [ProductionCompanyId] int NOT NULL,
    CONSTRAINT [PK_Movie] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Movie_ProductionCompany_ProductionCompanyId] FOREIGN KEY ([ProductionCompanyId]) REFERENCES [ProductionCompany] ([Id]) ON DELETE CASCADE
);
GO


CREATE TABLE [MovieDetail] (
    [MovieId] int NOT NULL,
    [Name] nvarchar(50) NOT NULL,
    [Poster] nvarchar(max) NOT NULL,
    [Budget] Money NOT NULL,
    [Gross] decimal(18,2) NOT NULL,
    [ReleaseDate] Date NOT NULL,
    CONSTRAINT [PK_MovieDetail] PRIMARY KEY ([MovieId]),
    CONSTRAINT [FK_MovieDetail_Movie_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movie] ([Id]) ON DELETE CASCADE
);
GO


CREATE TABLE [MovieDistribution] (
    [MovieId] int NOT NULL,
    [DistributionId] int NOT NULL,
    CONSTRAINT [PK_MovieDistribution] PRIMARY KEY ([MovieId], [DistributionId]),
    CONSTRAINT [FK_MovieDistribution_Distribution_DistributionId] FOREIGN KEY ([DistributionId]) REFERENCES [Distribution] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_MovieDistribution_Movie_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [Movie] ([Id]) ON DELETE CASCADE
);
GO


CREATE INDEX [IX_Movie_ProductionCompanyId] ON [Movie] ([ProductionCompanyId]);
GO


CREATE INDEX [IX_MovieDistribution_DistributionId] ON [MovieDistribution] ([DistributionId]);
GO