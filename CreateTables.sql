USE [Proyecto1]
GO

/****** Object:  Table [dbo].[Estados]    Script Date: 4/12/2015 10:17:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Estados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Encargados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Cargo] [varchar](50) NOT NULL,
	[Telefono] [varchar](15) NULL,
 CONSTRAINT [PK_Encargados] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[FabricanteAutomoviles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Fabricantes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[FabricantePartes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FabricantePartes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Marcas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Marcas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Proveedores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Ciudad] [varchar](50) NOT NULL,
	[NombreEncargado] [varchar](50) NOT NULL,
	[Telefono] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Clientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Cedula] [varchar](9) NOT NULL,
	[DireccionExacta] [varchar](50) NOT NULL,
	[Ciudad] [varchar](50) NOT NULL,
	[IdEncargado] [int] NULL,
	[IdEstado] [int] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Automoviles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Modelo] [char](10) NOT NULL,
	[Anno] [int] NOT NULL,
	[Detalle] [varchar](50) NOT NULL,
	[IdFabricanteAutomovil] [int] NOT NULL,
 CONSTRAINT [PK_Automoviles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Precios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PrecioProveedor] [money] NOT NULL,
	[PrecioVenta] [money] NOT NULL,
	[ProcentajeGanancia] [int] NOT NULL,
	[IdFabricanteParte] [int] NOT NULL,
 CONSTRAINT [PK_Precios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Partes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[IdPrecio] [int] NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[IdMarca] [int] NOT NULL,
	[IdAutomovil] [int] NOT NULL,
 CONSTRAINT [PK_Partes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Ordenes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdParte] [int] NOT NULL,
	[ImpuestoVenta] [int] NOT NULL,
	[Monto] [money] NOT NULL,
	[MontoTotal] [money] NOT NULL,
 CONSTRAINT [PK_Ordenes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/* Constraints Clientes */
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Encargados] FOREIGN KEY([IdEncargado])
REFERENCES [dbo].[Encargados] ([Id])
GO

ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Encargados]
GO

ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Estados] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Estados] ([Id])
GO

ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Estados]
GO

/* Constraints Automoviles */
ALTER TABLE [dbo].[Automoviles]  WITH CHECK ADD  CONSTRAINT [FK_Automoviles_Fabricantes] FOREIGN KEY([IdFabricanteAutomovil])
REFERENCES [dbo].[FabricanteAutomoviles] ([Id])
GO

ALTER TABLE [dbo].[Automoviles] CHECK CONSTRAINT [FK_Automoviles_Fabricantes]
GO

/* Constraints Precios */
ALTER TABLE [dbo].[Precios]  WITH CHECK ADD  CONSTRAINT [FK_Precios_FabricantePartes] FOREIGN KEY([IdFabricanteParte])
REFERENCES [dbo].[FabricantePartes] ([Id])
GO

ALTER TABLE [dbo].[Precios] CHECK CONSTRAINT [FK_Precios_FabricantePartes]
GO

/* Constraints partes */
ALTER TABLE [dbo].[Partes]  WITH CHECK ADD  CONSTRAINT [FK_Partes_Automoviles] FOREIGN KEY([IdAutomovil])
REFERENCES [dbo].[Automoviles] ([Id])
GO

ALTER TABLE [dbo].[Partes] CHECK CONSTRAINT [FK_Partes_Automoviles]
GO

ALTER TABLE [dbo].[Partes]  WITH CHECK ADD  CONSTRAINT [FK_Partes_Marcas] FOREIGN KEY([IdMarca])
REFERENCES [dbo].[Marcas] ([Id])
GO

ALTER TABLE [dbo].[Partes] CHECK CONSTRAINT [FK_Partes_Marcas]
GO

ALTER TABLE [dbo].[Partes]  WITH CHECK ADD  CONSTRAINT [FK_Partes_Precios] FOREIGN KEY([IdPrecio])
REFERENCES [dbo].[Precios] ([Id])
GO

ALTER TABLE [dbo].[Partes] CHECK CONSTRAINT [FK_Partes_Precios]
GO

ALTER TABLE [dbo].[Partes]  WITH CHECK ADD  CONSTRAINT [FK_Partes_Proveedores] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedores] ([Id])
GO

ALTER TABLE [dbo].[Partes] CHECK CONSTRAINT [FK_Partes_Proveedores]
GO

/* Constraints Ordenes */
ALTER TABLE [dbo].[Ordenes]  WITH CHECK ADD  CONSTRAINT [FK_Ordenes_Clientes] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([Id])
GO

ALTER TABLE [dbo].[Ordenes] CHECK CONSTRAINT [FK_Ordenes_Clientes]
GO

ALTER TABLE [dbo].[Ordenes]  WITH CHECK ADD  CONSTRAINT [FK_Ordenes_Partes] FOREIGN KEY([IdParte])
REFERENCES [dbo].[Partes] ([Id])
GO

ALTER TABLE [dbo].[Ordenes] CHECK CONSTRAINT [FK_Ordenes_Partes]
GO






