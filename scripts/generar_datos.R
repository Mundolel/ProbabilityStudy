# ============================================================================
# GENERACIÓN DE DATOS - Entidad Financiera
# Análisis Estadístico con Aplicación en R
# ============================================================================

set.seed(2025)

# --- Datos base proporcionados en el enunciado ---
datos_base <- data.frame(
  Cliente      = c(1, 2, 3, 4, 5, 6, 7, 60),
  SalarioAnual = c(19388, 49898, 28219, 83601, 29736, 50235, 45976, 26820),
  Industria    = c(1, 2, 0, 0, 0, 1, 0, 0),
  Ocupacion    = c(0, 0, 3, 5, 4, 1, 2, 5)
)

# --- Generar 52 registros hipotéticos (clientes 8 a 59) ---
n_gen <- 52

# Salarios: distribución log-normal para simular salarios realistas (sesgada a la derecha)
salarios_gen <- round(rlnorm(n_gen, meanlog = log(38000), sdlog = 0.45))
# Asegurar rango realista entre 15000 y 95000
salarios_gen <- pmin(pmax(salarios_gen, 15000), 95000)

# Industria: 0=Otra(40%), 1=Manufactura(35%), 2=Construcción(25%)
industria_gen <- sample(c(0, 1, 2), size = n_gen, replace = TRUE,
                        prob = c(0.40, 0.35, 0.25))

# Ocupación: 0=Otro(10%), 1=Administrador(20%), 2=Ventas(15%),
#            3=Operario oficina(20%), 4=Servicios generales(15%), 5=Ingeniero(20%)
ocupacion_gen <- sample(0:5, size = n_gen, replace = TRUE,
                        prob = c(0.10, 0.20, 0.15, 0.20, 0.15, 0.20))

datos_gen <- data.frame(
  Cliente      = 8:59,
  SalarioAnual = salarios_gen,
  Industria    = industria_gen,
  Ocupacion    = ocupacion_gen
)

# --- Combinar y ordenar ---
datos <- rbind(datos_base, datos_gen)
datos <- datos[order(datos$Cliente), ]
rownames(datos) <- NULL

# --- Convertir variables categóricas a factores con etiquetas ---
datos$IndustriaCat <- factor(datos$Industria,
                             levels = c(0, 1, 2),
                             labels = c("Otra", "Manufactura", "Construcción"))

datos$OcupacionCat <- factor(datos$Ocupacion,
                             levels = c(0, 1, 2, 3, 4, 5),
                             labels = c("Otro", "Administrador", "Ventas",
                                        "Operario oficina", "Servicios generales",
                                        "Ingeniero"))

# --- Guardar CSV ---
write.csv(datos, "data/clientes_banco.csv", row.names = FALSE)
cat("Dataset generado exitosamente: data/clientes_banco.csv\n")
cat("Total de registros:", nrow(datos), "\n")
cat("\nPrimeros 10 registros:\n")
print(head(datos, 10))
cat("\nResumen del dataset:\n")
str(datos)
