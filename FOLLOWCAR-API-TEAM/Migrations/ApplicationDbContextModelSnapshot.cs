﻿// <auto-generated />
using System;
using FOLLOWCAR_API_TEAM.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace FOLLOWCAR_API_TEAM.Migrations
{
    [DbContext(typeof(ApplicationDbContext))]
    partial class ApplicationDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.14")
                .HasAnnotation("Relational:MaxIdentifierLength", 64);

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.CategoriaInventario", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("Descripcion")
                        .HasColumnType("longtext");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("varchar(100)");

                    b.HasKey("Id");

                    b.ToTable("CategoriasInventario");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.CategoriaServicio", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("Descripcion")
                        .HasColumnType("longtext");

                    b.Property<string>("Icono")
                        .HasMaxLength(50)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("varchar(100)");

                    b.HasKey("Id");

                    b.ToTable("CategoriasServicio");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Cita", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<int>("ClienteId")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("Estado")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("varchar(50)");

                    b.Property<DateTime>("FechaHora")
                        .HasColumnType("datetime(6)");

                    b.Property<int?>("MecanicoId")
                        .HasColumnType("int");

                    b.Property<string>("MotivoCancelacion")
                        .HasColumnType("longtext");

                    b.Property<string>("ObservacionesCliente")
                        .HasColumnType("longtext");

                    b.Property<string>("ObservacionesInternas")
                        .HasColumnType("longtext");

                    b.Property<string>("Prioridad")
                        .IsRequired()
                        .HasMaxLength(10)
                        .HasColumnType("varchar(10)");

                    b.Property<int>("TipoServicioId")
                        .HasColumnType("int");

                    b.Property<DateTime>("UpdatedAt")
                        .HasColumnType("datetime(6)");

                    b.Property<int>("VehiculoId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("ClienteId");

                    b.HasIndex("MecanicoId");

                    b.HasIndex("TipoServicioId");

                    b.HasIndex("VehiculoId");

                    b.ToTable("Citas");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Cotizacion", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime(6)");

                    b.Property<int>("DiagnosticoId")
                        .HasColumnType("int");

                    b.Property<string>("Estado")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("varchar(20)");

                    b.Property<DateTime?>("FechaAprobacion")
                        .HasColumnType("datetime(6)");

                    b.Property<DateTime>("FechaExpiracion")
                        .HasColumnType("datetime(6)");

                    b.Property<decimal>("IVA")
                        .HasColumnType("decimal(10, 2)");

                    b.Property<string>("MotivoRechazo")
                        .HasColumnType("longtext");

                    b.Property<string>("NumeroCotizacion")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("varchar(20)");

                    b.Property<decimal>("Subtotal")
                        .HasColumnType("decimal(10, 2)");

                    b.Property<decimal>("Total")
                        .HasColumnType("decimal(10, 2)");

                    b.Property<DateTime>("UpdatedAt")
                        .HasColumnType("datetime(6)");

                    b.HasKey("Id");

                    b.HasIndex("DiagnosticoId");

                    b.ToTable("Cotizaciones");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.DetalleCotizacion", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<int>("Cantidad")
                        .HasColumnType("int");

                    b.Property<int>("CotizacionId")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("Descripcion")
                        .IsRequired()
                        .HasMaxLength(255)
                        .HasColumnType("varchar(255)");

                    b.Property<string>("Notas")
                        .HasColumnType("longtext");

                    b.Property<int?>("PiezaId")
                        .HasColumnType("int");

                    b.Property<decimal>("PrecioUnitario")
                        .HasColumnType("decimal(10, 2)");

                    b.Property<int?>("ServicioId")
                        .HasColumnType("int");

                    b.Property<decimal>("Subtotal")
                        .HasColumnType("decimal(10, 2)");

                    b.Property<string>("Tipo")
                        .IsRequired()
                        .HasMaxLength(10)
                        .HasColumnType("varchar(10)");

                    b.HasKey("Id");

                    b.HasIndex("CotizacionId");

                    b.HasIndex("PiezaId");

                    b.HasIndex("ServicioId");

                    b.ToTable("DetallesCotizacion");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Diagnostico", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<int>("CitaId")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("DescripcionProblema")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<string>("DiagnosticoDetallado")
                        .HasColumnType("longtext");

                    b.Property<string>("Estado")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("varchar(20)");

                    b.Property<DateTime?>("FechaFin")
                        .HasColumnType("datetime(6)");

                    b.Property<DateTime?>("FechaInicio")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("FotosEvidencia")
                        .HasColumnType("longtext");

                    b.Property<int>("MecanicoId")
                        .HasColumnType("int");

                    b.Property<string>("Recomendaciones")
                        .HasColumnType("longtext");

                    b.Property<DateTime>("UpdatedAt")
                        .HasColumnType("datetime(6)");

                    b.HasKey("Id");

                    b.HasIndex("CitaId");

                    b.HasIndex("MecanicoId");

                    b.ToTable("Diagnosticos");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.DocumentoVehiculo", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<string>("ArchivoUrl")
                        .IsRequired()
                        .HasMaxLength(255)
                        .HasColumnType("varchar(255)");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime(6)");

                    b.Property<DateTime?>("FechaVencimiento")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("Tipo")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("varchar(20)");

                    b.Property<int>("VehiculoId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("VehiculoId");

                    b.ToTable("DocumentosVehiculo");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Especialidad", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("Descripcion")
                        .HasColumnType("longtext");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("varchar(100)");

                    b.HasKey("Id");

                    b.ToTable("Especialidades");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Factura", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<int>("CotizacionId")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("Estado")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("varchar(20)");

                    b.Property<DateTime>("FechaEmision")
                        .HasColumnType("datetime(6)");

                    b.Property<decimal>("IVA")
                        .HasColumnType("decimal(10, 2)");

                    b.Property<string>("MetodoPago")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("varchar(20)");

                    b.Property<string>("Notas")
                        .HasColumnType("longtext");

                    b.Property<string>("NumeroFactura")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("varchar(20)");

                    b.Property<decimal>("Subtotal")
                        .HasColumnType("decimal(10, 2)");

                    b.Property<decimal>("Total")
                        .HasColumnType("decimal(10, 2)");

                    b.Property<DateTime>("UpdatedAt")
                        .HasColumnType("datetime(6)");

                    b.HasKey("Id");

                    b.HasIndex("CotizacionId");

                    b.ToTable("Facturas");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Inventario", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<int>("Cantidad")
                        .HasColumnType("int");

                    b.Property<int>("CategoriaId")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("Descripcion")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<string>("Estado")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("varchar(20)");

                    b.Property<string>("ImagenUrl")
                        .HasMaxLength(255)
                        .HasColumnType("varchar(255)");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("varchar(100)");

                    b.Property<decimal>("PrecioCompra")
                        .HasColumnType("decimal(10, 2)");

                    b.Property<decimal>("PrecioVenta")
                        .HasColumnType("decimal(10, 2)");

                    b.Property<int>("PuntoReorden")
                        .HasColumnType("int");

                    b.Property<string>("SKU")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("Ubicacion")
                        .HasColumnType("longtext");

                    b.Property<DateTime>("UpdatedAt")
                        .HasColumnType("datetime(6)");

                    b.HasKey("Id");

                    b.HasIndex("CategoriaId");

                    b.ToTable("Inventarios");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.MecanicoEspecialidad", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime(6)");

                    b.Property<int>("EspecialidadId")
                        .HasColumnType("int");

                    b.Property<DateTime?>("FechaCertificacion")
                        .HasColumnType("datetime(6)");

                    b.Property<int>("MecanicoId")
                        .HasColumnType("int");

                    b.Property<int>("NivelExperiencia")
                        .HasColumnType("int");

                    b.Property<string>("NumeroCertificado")
                        .HasColumnType("longtext");

                    b.HasKey("Id");

                    b.HasIndex("EspecialidadId");

                    b.HasIndex("MecanicoId");

                    b.ToTable("MecanicoEspecialidades");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Mensaje", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<string>("Contenido")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<int>("DestinatarioId")
                        .HasColumnType("int");

                    b.Property<string>("Estado")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("varchar(20)");

                    b.Property<DateTime>("FechaEnvio")
                        .HasColumnType("datetime(6)");

                    b.Property<DateTime?>("FechaLectura")
                        .HasColumnType("datetime(6)");

                    b.Property<int>("RemitenteId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("DestinatarioId");

                    b.HasIndex("RemitenteId");

                    b.ToTable("Mensajes");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.MovimientoInventario", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<int>("ArticuloId")
                        .HasColumnType("int");

                    b.Property<int>("Cantidad")
                        .HasColumnType("int");

                    b.Property<int?>("CitaId")
                        .HasColumnType("int");

                    b.Property<DateTime>("FechaMovimiento")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("Motivo")
                        .HasColumnType("longtext");

                    b.Property<string>("TipoMovimiento")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("varchar(20)");

                    b.Property<int?>("UsuarioId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("ArticuloId");

                    b.HasIndex("CitaId");

                    b.HasIndex("UsuarioId");

                    b.ToTable("MovimientosInventario");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Notificacion", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<string>("Contenido")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<string>("Estado")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("varchar(20)");

                    b.Property<DateTime>("FechaEnvio")
                        .HasColumnType("datetime(6)");

                    b.Property<DateTime?>("FechaLectura")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("Tipo")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("varchar(50)");

                    b.Property<int>("UsuarioId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("UsuarioId");

                    b.ToTable("Notificaciones");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Pago", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<string>("Estado")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("varchar(20)");

                    b.Property<int>("FacturaId")
                        .HasColumnType("int");

                    b.Property<DateTime>("FechaPago")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("MetodoPago")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("varchar(50)");

                    b.Property<decimal>("Monto")
                        .HasColumnType("decimal(10, 2)");

                    b.Property<string>("Notas")
                        .HasColumnType("longtext");

                    b.Property<string>("NumeroReferencia")
                        .HasMaxLength(100)
                        .HasColumnType("varchar(100)");

                    b.HasKey("Id");

                    b.HasIndex("FacturaId");

                    b.ToTable("Pagos");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Rol", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("Descripcion")
                        .HasColumnType("longtext");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("varchar(50)");

                    b.HasKey("Id");

                    b.ToTable("Roles");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.TipoServicio", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<int>("CategoriaId")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("Descripcion")
                        .IsRequired()
                        .HasColumnType("longtext");

                    b.Property<int>("DuracionEstimada")
                        .HasColumnType("int");

                    b.Property<string>("Estado")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("varchar(20)");

                    b.Property<string>("IconoUrl")
                        .HasMaxLength(255)
                        .HasColumnType("varchar(255)");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("varchar(100)");

                    b.Property<decimal>("Precio")
                        .HasColumnType("decimal(10, 2)");

                    b.Property<DateTime>("UpdatedAt")
                        .HasColumnType("datetime(6)");

                    b.HasKey("Id");

                    b.HasIndex("CategoriaId");

                    b.ToTable("TiposServicio");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Usuario", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<string>("Apellido")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("varchar(50)");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("DNI")
                        .HasMaxLength(20)
                        .HasColumnType("varchar(20)");

                    b.Property<string>("Direccion")
                        .HasColumnType("longtext");

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("varchar(100)");

                    b.Property<string>("Estado")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("varchar(20)");

                    b.Property<DateTime?>("FechaNacimiento")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("FotoUrl")
                        .HasMaxLength(255)
                        .HasColumnType("varchar(255)");

                    b.Property<string>("Nombre")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("Password")
                        .IsRequired()
                        .HasMaxLength(255)
                        .HasColumnType("varchar(255)");

                    b.Property<int>("RolId")
                        .HasColumnType("int");

                    b.Property<string>("Telefono")
                        .HasMaxLength(20)
                        .HasColumnType("varchar(20)");

                    b.Property<DateTime>("UpdatedAt")
                        .HasColumnType("datetime(6)");

                    b.HasKey("Id");

                    b.HasIndex("RolId");

                    b.ToTable("Usuarios");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Vehiculo", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<int>("Anio")
                        .HasColumnType("int");

                    b.Property<string>("Color")
                        .HasMaxLength(50)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("Combustible")
                        .HasColumnType("longtext");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("Estado")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("varchar(20)");

                    b.Property<string>("FotoUrl")
                        .HasMaxLength(255)
                        .HasColumnType("varchar(255)");

                    b.Property<int?>("Kilometraje")
                        .HasColumnType("int");

                    b.Property<string>("Marca")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("Modelo")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("NumeroPlaca")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("varchar(20)");

                    b.Property<int>("PropietarioId")
                        .HasColumnType("int");

                    b.Property<string>("Tipo")
                        .HasColumnType("longtext");

                    b.Property<string>("Transmision")
                        .HasColumnType("longtext");

                    b.Property<DateTime>("UpdatedAt")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("VIN")
                        .IsRequired()
                        .HasMaxLength(17)
                        .HasColumnType("varchar(17)");

                    b.HasKey("Id");

                    b.HasIndex("PropietarioId");

                    b.ToTable("Vehiculos");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Cita", b =>
                {
                    b.HasOne("FOLLOWCAR_API_TEAM.Models.Usuario", "Cliente")
                        .WithMany()
                        .HasForeignKey("ClienteId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("FOLLOWCAR_API_TEAM.Models.Usuario", "Mecanico")
                        .WithMany()
                        .HasForeignKey("MecanicoId")
                        .OnDelete(DeleteBehavior.Restrict);

                    b.HasOne("FOLLOWCAR_API_TEAM.Models.TipoServicio", "TipoServicio")
                        .WithMany()
                        .HasForeignKey("TipoServicioId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("FOLLOWCAR_API_TEAM.Models.Vehiculo", "Vehiculo")
                        .WithMany()
                        .HasForeignKey("VehiculoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Cliente");

                    b.Navigation("Mecanico");

                    b.Navigation("TipoServicio");

                    b.Navigation("Vehiculo");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Cotizacion", b =>
                {
                    b.HasOne("FOLLOWCAR_API_TEAM.Models.Diagnostico", "Diagnostico")
                        .WithMany()
                        .HasForeignKey("DiagnosticoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Diagnostico");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.DetalleCotizacion", b =>
                {
                    b.HasOne("FOLLOWCAR_API_TEAM.Models.Cotizacion", "Cotizacion")
                        .WithMany()
                        .HasForeignKey("CotizacionId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("FOLLOWCAR_API_TEAM.Models.Inventario", "Pieza")
                        .WithMany()
                        .HasForeignKey("PiezaId");

                    b.HasOne("FOLLOWCAR_API_TEAM.Models.TipoServicio", "Servicio")
                        .WithMany()
                        .HasForeignKey("ServicioId");

                    b.Navigation("Cotizacion");

                    b.Navigation("Pieza");

                    b.Navigation("Servicio");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Diagnostico", b =>
                {
                    b.HasOne("FOLLOWCAR_API_TEAM.Models.Cita", "Cita")
                        .WithMany()
                        .HasForeignKey("CitaId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("FOLLOWCAR_API_TEAM.Models.Usuario", "Mecanico")
                        .WithMany()
                        .HasForeignKey("MecanicoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Cita");

                    b.Navigation("Mecanico");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.DocumentoVehiculo", b =>
                {
                    b.HasOne("FOLLOWCAR_API_TEAM.Models.Vehiculo", "Vehiculo")
                        .WithMany()
                        .HasForeignKey("VehiculoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Vehiculo");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Factura", b =>
                {
                    b.HasOne("FOLLOWCAR_API_TEAM.Models.Cotizacion", "Cotizacion")
                        .WithMany()
                        .HasForeignKey("CotizacionId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Cotizacion");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Inventario", b =>
                {
                    b.HasOne("FOLLOWCAR_API_TEAM.Models.CategoriaInventario", "Categoria")
                        .WithMany()
                        .HasForeignKey("CategoriaId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Categoria");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.MecanicoEspecialidad", b =>
                {
                    b.HasOne("FOLLOWCAR_API_TEAM.Models.Especialidad", "Especialidad")
                        .WithMany()
                        .HasForeignKey("EspecialidadId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("FOLLOWCAR_API_TEAM.Models.Usuario", "Mecanico")
                        .WithMany()
                        .HasForeignKey("MecanicoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Especialidad");

                    b.Navigation("Mecanico");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Mensaje", b =>
                {
                    b.HasOne("FOLLOWCAR_API_TEAM.Models.Usuario", "Destinatario")
                        .WithMany()
                        .HasForeignKey("DestinatarioId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("FOLLOWCAR_API_TEAM.Models.Usuario", "Remitente")
                        .WithMany()
                        .HasForeignKey("RemitenteId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Destinatario");

                    b.Navigation("Remitente");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.MovimientoInventario", b =>
                {
                    b.HasOne("FOLLOWCAR_API_TEAM.Models.Inventario", "Articulo")
                        .WithMany()
                        .HasForeignKey("ArticuloId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("FOLLOWCAR_API_TEAM.Models.Cita", "Cita")
                        .WithMany()
                        .HasForeignKey("CitaId");

                    b.HasOne("FOLLOWCAR_API_TEAM.Models.Usuario", "Usuario")
                        .WithMany()
                        .HasForeignKey("UsuarioId");

                    b.Navigation("Articulo");

                    b.Navigation("Cita");

                    b.Navigation("Usuario");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Notificacion", b =>
                {
                    b.HasOne("FOLLOWCAR_API_TEAM.Models.Usuario", "Usuario")
                        .WithMany()
                        .HasForeignKey("UsuarioId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Usuario");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Pago", b =>
                {
                    b.HasOne("FOLLOWCAR_API_TEAM.Models.Factura", "Factura")
                        .WithMany()
                        .HasForeignKey("FacturaId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Factura");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.TipoServicio", b =>
                {
                    b.HasOne("FOLLOWCAR_API_TEAM.Models.CategoriaServicio", "Categoria")
                        .WithMany()
                        .HasForeignKey("CategoriaId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Categoria");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Usuario", b =>
                {
                    b.HasOne("FOLLOWCAR_API_TEAM.Models.Rol", "Rol")
                        .WithMany()
                        .HasForeignKey("RolId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.Navigation("Rol");
                });

            modelBuilder.Entity("FOLLOWCAR_API_TEAM.Models.Vehiculo", b =>
                {
                    b.HasOne("FOLLOWCAR_API_TEAM.Models.Usuario", "Propietario")
                        .WithMany()
                        .HasForeignKey("PropietarioId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Propietario");
                });
#pragma warning restore 612, 618
        }
    }
}
