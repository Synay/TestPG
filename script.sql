USE [DBClientes]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 01-07-2024 12:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Pais] [varchar](60) NULL,
	[FechaCreacion] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_crearCliente]    Script Date: 01-07-2024 12:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_crearCliente](
@Nombre varchar(50),
@Telefono varchar(50),
@Pais varchar(60),
@FechaCreacion varchar(10)
)
as
begin
	set dateformat dmy

	insert into Cliente
	(
	Nombre,
	Telefono,
	Pais,
	FechaCreacion
	)
	values
	(
	@Nombre,
	@Telefono,
	@Pais,
	convert(date,@FechaCreacion)
	)
end

GO
/****** Object:  StoredProcedure [dbo].[sp_editarCliente]    Script Date: 01-07-2024 12:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_editarCliente](
@Id int,
@Nombre varchar(50),
@Telefono varchar(50),
@Pais varchar(60),
@FechaCreacion varchar(10)
)
as
begin
	set dateformat dmy

	update Cliente
	set
	Nombre = @Nombre,
	Telefono = @Telefono,
	Pais = @Pais,
	@FechaCreacion = convert(date,@FechaCreacion)
	where Id = @Id
end

GO
/****** Object:  StoredProcedure [dbo].[sp_eliminarCliente]    Script Date: 01-07-2024 12:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_eliminarCliente](
@Id int
)
as
begin
	delete from Cliente where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_listaClientes]    Script Date: 01-07-2024 12:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[sp_listaClientes]
as
begin
	
	select 
	Id,
	Nombre,
	Telefono,
	Pais,
	convert(char(10),FechaCreacion,103)[FechaCreacion]
	from Cliente
	
end

GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerCliente]    Script Date: 01-07-2024 12:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_obtenerCliente]
(
@Id int
)
as
begin
	
	select 
	Id,
	Nombre,
	Telefono,
	Pais,
	convert(char(10),FechaCreacion,103)[FechaCreacion]
	from Cliente where Id = @Id
	
end

GO
