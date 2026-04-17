# ============================================================================
# ANÁLISIS ESTADÍSTICO CON APLICACIÓN EN R
# Entidad Financiera - 60 Clientes
# ============================================================================
# Variables:
#   X1 = Salario Anual (dólares) - Cuantitativa continua
#   X2 = Industria               - Cualitativa nominal
#   X3 = Ocupación               - Cualitativa nominal
# ============================================================================

# --- Configuración inicial ---
options(OutDec = ".", scipen = 999)

# Configurar librería de usuario
user_lib <- Sys.getenv("R_LIBS_USER")
if (!dir.exists(user_lib)) dir.create(user_lib, recursive = TRUE)
.libPaths(c(user_lib, .libPaths()))

# Verificar e instalar paquetes necesarios
paquetes <- c("ggplot2", "moments")
for (pkg in paquetes) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg, lib = user_lib, repos = "https://cloud.r-project.org")
  }
}
library(ggplot2)
library(moments)

# --- Cargar datos ---
datos <- read.csv("data/clientes_banco.csv", stringsAsFactors = FALSE)

# Recrear factores con etiquetas
datos$IndustriaCat <- factor(datos$Industria,
                             levels = c(0, 1, 2),
                             labels = c("Otra", "Manufactura", "Construcción"))

datos$OcupacionCat <- factor(datos$Ocupacion,
                             levels = c(0, 1, 2, 3, 4, 5),
                             labels = c("Otro", "Administrador", "Ventas",
                                        "Operario oficina", "Servicios generales",
                                        "Ingeniero"))

# Crear directorio de salida
if (!dir.exists("output")) dir.create("output")

# ============================================================================
# PUNTO 1: DESCRIPCIÓN DE LA POBLACIÓN DE INTERÉS
# ============================================================================
cat("================================================================\n")
cat("PUNTO 1: DESCRIPCIÓN DE LA POBLACIÓN DE INTERÉS\n")
cat("================================================================\n\n")
cat("La población de interés está conformada por los 60 clientes de una\n")
cat("entidad financiera (banco). Se busca caracterizar su comportamiento\n")
cat("en función de tres variables: salario anual en dólares, tipo de\n")
cat("industria en la que trabajan y su ocupación laboral.\n")
cat("El objetivo es analizar la base de datos para ofrecer productos y\n")
cat("servicios bancarios personalizados para todos los clientes o\n")
cat("segmentos de ellos.\n\n")
cat("Tamaño de la población: N =", nrow(datos), "clientes\n\n")

# ============================================================================
# PUNTO 2: CLASIFICACIÓN DE LAS VARIABLES
# ============================================================================
cat("================================================================\n")
cat("PUNTO 2: CLASIFICACIÓN DE LAS VARIABLES\n")
cat("================================================================\n\n")
cat("X1 - Salario Anual (Dólares):\n")
cat("   Tipo: Cuantitativa continua\n")
cat("   Escala: De razón\n")
cat("   Descripción: Ingreso anual del cliente en dólares estadounidenses\n\n")
cat("X2 - Tipo de Industria:\n")
cat("   Tipo: Cualitativa nominal\n")
cat("   Escala: Nominal\n")
cat("   Categorías: 0=Otra, 1=Manufactura, 2=Construcción\n\n")
cat("X3 - Ocupación:\n")
cat("   Tipo: Cualitativa nominal\n")
cat("   Escala: Nominal\n")
cat("   Categorías: 0=Otro, 1=Administrador, 2=Ventas,\n")
cat("               3=Operario de oficina, 4=Servicios generales,\n")
cat("               5=Ingeniero\n\n")

# ============================================================================
# PUNTO 3: TABLA DE FRECUENCIAS Y DIAGRAMA CIRCULAR - OCUPACIÓN
# ============================================================================
cat("================================================================\n")
cat("PUNTO 3: TABLA DE FRECUENCIAS Y DIAGRAMA CIRCULAR - OCUPACIÓN\n")
cat("================================================================\n\n")

# Tabla de frecuencias
freq_ocup <- table(datos$OcupacionCat)
rel_ocup <- prop.table(freq_ocup)
acum_ocup <- cumsum(freq_ocup)
rel_acum_ocup <- cumsum(rel_ocup)

tabla_ocup <- data.frame(
  Categoria          = names(freq_ocup),
  Frec_Absoluta      = as.integer(freq_ocup),
  Frec_Relativa      = round(as.numeric(rel_ocup), 4),
  Porcentaje         = round(as.numeric(rel_ocup) * 100, 2),
  Frec_Acumulada     = as.integer(acum_ocup),
  Frec_Rel_Acumulada = round(as.numeric(rel_acum_ocup), 4)
)

cat("Tabla de frecuencias - Ocupación:\n")
print(tabla_ocup, row.names = FALSE)
cat("\n")

# Diagrama circular
png("output/03_diagrama_circular_ocupacion.png", width = 800, height = 600)
porcentajes <- round(rel_ocup * 100, 1)
etiquetas <- paste0(names(freq_ocup), "\n", freq_ocup, " (", porcentajes, "%)")
colores <- c("#E74C3C", "#3498DB", "#2ECC71", "#F39C12", "#9B59B6", "#1ABC9C")
pie(freq_ocup,
    labels = etiquetas,
    col = colores,
    main = "Distribución de Clientes por Ocupación",
    cex = 0.9,
    cex.main = 1.3)
dev.off()
cat("Gráfico guardado: output/03_diagrama_circular_ocupacion.png\n")

# Comentario
cat("\nComentario: La variable Ocupación muestra la distribución de los clientes\n")
cat("según su cargo laboral. Se observa la participación de cada categoría\n")
cat("en el total de clientes de la entidad financiera.\n\n")

# ============================================================================
# PUNTO 4: TABLA DE FRECUENCIAS Y DIAGRAMA DE BARRAS - INDUSTRIA
# ============================================================================
cat("================================================================\n")
cat("PUNTO 4: TABLA DE FRECUENCIAS Y DIAGRAMA DE BARRAS - INDUSTRIA\n")
cat("================================================================\n\n")

# Tabla de frecuencias
freq_ind <- table(datos$IndustriaCat)
rel_ind <- prop.table(freq_ind)
acum_ind <- cumsum(freq_ind)
rel_acum_ind <- cumsum(rel_ind)

tabla_ind <- data.frame(
  Categoria          = names(freq_ind),
  Frec_Absoluta      = as.integer(freq_ind),
  Frec_Relativa      = round(as.numeric(rel_ind), 4),
  Porcentaje         = round(as.numeric(rel_ind) * 100, 2),
  Frec_Acumulada     = as.integer(acum_ind),
  Frec_Rel_Acumulada = round(as.numeric(rel_acum_ind), 4)
)

cat("Tabla de frecuencias - Tipo de Industria:\n")
print(tabla_ind, row.names = FALSE)
cat("\n")

# Diagrama de barras
png("output/04_diagrama_barras_industria.png", width = 800, height = 600)
colores_ind <- c("#3498DB", "#E74C3C", "#F39C12")
bp <- barplot(freq_ind,
              col = colores_ind,
              main = "Distribución de Clientes por Tipo de Industria",
              xlab = "Tipo de Industria",
              ylab = "Frecuencia Absoluta",
              ylim = c(0, max(freq_ind) + 5),
              cex.main = 1.3,
              cex.names = 1.1)
text(bp, freq_ind, labels = paste0(freq_ind, " (", round(rel_ind * 100, 1), "%)"),
     pos = 3, cex = 1.1, font = 2)
dev.off()
cat("Gráfico guardado: output/04_diagrama_barras_industria.png\n")

# Comentario
cat("\nComentario: La variable Industria presenta la distribución de los clientes\n")
cat("según el sector económico en el que laboran. Se pueden identificar los\n")
cat("sectores con mayor y menor representación en la cartera de clientes.\n\n")

# ============================================================================
# PUNTO 5: TABLA DE FRECUENCIAS E HISTOGRAMA - SALARIO ANUAL
# ============================================================================
cat("================================================================\n")
cat("PUNTO 5: TABLA DE FRECUENCIAS E HISTOGRAMA - SALARIO ANUAL\n")
cat("================================================================\n\n")

# Número de clases (regla de Sturges)
n <- nrow(datos)
k <- ceiling(1 + 3.322 * log10(n))
cat("Número de clases (Sturges): k =", k, "\n\n")

# Rango y amplitud
rango <- max(datos$SalarioAnual) - min(datos$SalarioAnual)
amplitud <- ceiling(rango / k)
lim_inf <- min(datos$SalarioAnual)

# Construir intervalos
cortes <- seq(lim_inf, lim_inf + k * amplitud, by = amplitud)
# Ajustar si el último corte no cubre el máximo
if (max(cortes) < max(datos$SalarioAnual)) {
  cortes <- c(cortes, max(cortes) + amplitud)
}

datos$ClaseSalario <- cut(datos$SalarioAnual, breaks = cortes, right = FALSE,
                          include.lowest = TRUE)

freq_sal <- table(datos$ClaseSalario)
rel_sal <- prop.table(freq_sal)
acum_sal <- cumsum(freq_sal)
rel_acum_sal <- cumsum(rel_sal)

tabla_sal <- data.frame(
  Intervalo          = names(freq_sal),
  Frec_Absoluta      = as.integer(freq_sal),
  Frec_Relativa      = round(as.numeric(rel_sal), 4),
  Porcentaje         = round(as.numeric(rel_sal) * 100, 2),
  Frec_Acumulada     = as.integer(acum_sal),
  Frec_Rel_Acumulada = round(as.numeric(rel_acum_sal), 4)
)

cat("Tabla de frecuencias - Salario Anual:\n")
print(tabla_sal, row.names = FALSE)
cat("\n")

# Histograma
png("output/05_histograma_salario.png", width = 800, height = 600)
hist(datos$SalarioAnual,
     breaks = cortes,
     col = "#3498DB",
     border = "white",
     main = "Distribución del Salario Anual de los Clientes",
     xlab = "Salario Anual (USD)",
     ylab = "Frecuencia",
     cex.main = 1.3,
     cex.lab = 1.1,
     right = FALSE)
abline(v = mean(datos$SalarioAnual), col = "#E74C3C", lwd = 2, lty = 2)
abline(v = median(datos$SalarioAnual), col = "#2ECC71", lwd = 2, lty = 2)
legend("topright",
       legend = c(paste("Media =", format(round(mean(datos$SalarioAnual), 0), big.mark = ",")),
                  paste("Mediana =", format(round(median(datos$SalarioAnual), 0), big.mark = ","))),
       col = c("#E74C3C", "#2ECC71"),
       lwd = 2, lty = 2, cex = 0.9)
dev.off()
cat("Gráfico guardado: output/05_histograma_salario.png\n")

# Comentario
cat("\nComentario: El histograma muestra la distribución de los salarios anuales.\n")
cat("Se puede observar la concentración de salarios y la forma de la distribución\n")
cat("(simetría o asimetría). Las líneas de referencia indican la media y mediana.\n\n")

# ============================================================================
# PUNTO 6: TABLA CRUZADA Y BARRAS APILADAS - OCUPACIÓN × INDUSTRIA
# ============================================================================
cat("================================================================\n")
cat("PUNTO 6: TABLA CRUZADA - OCUPACIÓN × INDUSTRIA\n")
cat("================================================================\n\n")

# Tabla cruzada (contingencia)
tabla_cruzada <- table(datos$OcupacionCat, datos$IndustriaCat)
cat("Tabla de contingencia (Ocupación × Industria):\n")
print(tabla_cruzada)
cat("\nTotales por fila (Ocupación):\n")
print(addmargins(tabla_cruzada))
cat("\n")

# Diagrama de barras apiladas
png("output/06_barras_apiladas_ocupacion_industria.png", width = 900, height = 600)
colores_ap <- c("#3498DB", "#E74C3C", "#F39C12")
par(mar = c(7, 4, 4, 8), xpd = TRUE)
barplot(t(tabla_cruzada),
        col = colores_ap,
        main = "Distribución de Ocupación por Tipo de Industria",
        xlab = "",
        ylab = "Frecuencia",
        las = 2,
        cex.main = 1.3,
        cex.names = 0.85,
        legend.text = colnames(tabla_cruzada),
        args.legend = list(x = "topright", inset = c(-0.15, 0),
                           cex = 0.9, title = "Industria"))
dev.off()
cat("Gráfico guardado: output/06_barras_apiladas_ocupacion_industria.png\n")

# Comentario
cat("\nComentario: La tabla cruzada y el diagrama de barras apiladas permiten\n")
cat("observar la relación entre la ocupación y el tipo de industria.\n")
cat("Se identifica cómo se distribuyen las ocupaciones dentro de cada sector.\n\n")

# ============================================================================
# PUNTO 7: RESUMEN ESTADÍSTICO - SALARIO ANUAL
# ============================================================================
cat("================================================================\n")
cat("PUNTO 7: RESUMEN ESTADÍSTICO - SALARIO ANUAL\n")
cat("================================================================\n\n")

salario <- datos$SalarioAnual

# --- Medidas de Centro ---
media <- mean(salario)
mediana <- median(salario)
# Moda (función manual)
calcular_moda <- function(x) {
  tabla <- table(x)
  modas <- as.numeric(names(tabla[tabla == max(tabla)]))
  if (length(modas) == length(unique(x))) return(NA)
  return(modas)
}
moda <- calcular_moda(salario)

cat("--- MEDIDAS DE CENTRO (TENDENCIA CENTRAL) ---\n")
cat("Media aritmética:", format(round(media, 2), big.mark = ","), "USD\n")
cat("Mediana:", format(round(mediana, 2), big.mark = ","), "USD\n")
if (any(is.na(moda))) {
  cat("Moda: No existe moda (todos los valores son distintos)\n")
} else {
  cat("Moda:", paste(format(moda, big.mark = ","), collapse = ", "), "USD\n")
}
cat("\n")

# --- Medidas de Posición ---
cuartiles <- quantile(salario, probs = c(0.25, 0.50, 0.75))
deciles <- quantile(salario, probs = seq(0.1, 0.9, by = 0.1))
percentiles_clave <- quantile(salario, probs = c(0.10, 0.25, 0.50, 0.75, 0.90))

cat("--- MEDIDAS DE POSICIÓN ---\n")
cat("Cuartiles:\n")
cat("  Q1 (25%):", format(round(cuartiles[1], 2), big.mark = ","), "USD\n")
cat("  Q2 (50%):", format(round(cuartiles[2], 2), big.mark = ","), "USD\n")
cat("  Q3 (75%):", format(round(cuartiles[3], 2), big.mark = ","), "USD\n")
cat("\nDeciles:\n")
for (i in 1:9) {
  cat(sprintf("  D%d (%d%%): %s USD\n", i, i * 10,
              format(round(deciles[i], 2), big.mark = ",")))
}
cat("\nPercentiles clave:\n")
cat("  P10:", format(round(percentiles_clave[1], 2), big.mark = ","), "USD\n")
cat("  P25:", format(round(percentiles_clave[2], 2), big.mark = ","), "USD\n")
cat("  P50:", format(round(percentiles_clave[3], 2), big.mark = ","), "USD\n")
cat("  P75:", format(round(percentiles_clave[4], 2), big.mark = ","), "USD\n")
cat("  P90:", format(round(percentiles_clave[5], 2), big.mark = ","), "USD\n")
cat("\n")

# --- Medidas de Variación (Dispersión) ---
rango_val <- max(salario) - min(salario)
iqr_val <- IQR(salario)
varianza <- var(salario)
desv_est <- sd(salario)
cv <- (desv_est / media) * 100

cat("--- MEDIDAS DE VARIACIÓN (DISPERSIÓN) ---\n")
cat("Valor mínimo:", format(min(salario), big.mark = ","), "USD\n")
cat("Valor máximo:", format(max(salario), big.mark = ","), "USD\n")
cat("Rango:", format(round(rango_val, 2), big.mark = ","), "USD\n")
cat("Rango intercuartílico (IQR):", format(round(iqr_val, 2), big.mark = ","), "USD\n")
cat("Varianza:", format(round(varianza, 2), big.mark = ","), "USD²\n")
cat("Desviación estándar:", format(round(desv_est, 2), big.mark = ","), "USD\n")
cat("Coeficiente de variación (CV):", round(cv, 2), "%\n")
cat("\n")

# --- Medidas de Forma ---
asimetria <- skewness(salario)
curtosis <- kurtosis(salario)

cat("--- MEDIDAS DE FORMA ---\n")
cat("Coeficiente de asimetría (Skewness):", round(asimetria, 4), "\n")
if (asimetria > 0.5) {
  cat("  Interpretación: Distribución asimétrica positiva (sesgada a la derecha)\n")
} else if (asimetria < -0.5) {
  cat("  Interpretación: Distribución asimétrica negativa (sesgada a la izquierda)\n")
} else {
  cat("  Interpretación: Distribución aproximadamente simétrica\n")
}
cat("\nCoeficiente de curtosis (Kurtosis):", round(curtosis, 4), "\n")
if (curtosis > 3) {
  cat("  Interpretación: Distribución leptocúrtica (colas pesadas, más apuntalada que la normal)\n")
} else if (curtosis < 3) {
  cat("  Interpretación: Distribución platicúrtica (colas livianas, más aplanada que la normal)\n")
} else {
  cat("  Interpretación: Distribución mesocúrtica (similar a la normal)\n")
}
cat("\n")

# Interpretación general
cat("--- INTERPRETACIÓN GENERAL ---\n")
cat("El salario anual promedio de los clientes es de", format(round(media, 0), big.mark = ","), "USD,\n")
cat("con una mediana de", format(round(mediana, 0), big.mark = ","), "USD.\n")
cat("La desviación estándar es de", format(round(desv_est, 0), big.mark = ","), "USD,\n")
cat("lo que indica un coeficiente de variación del", round(cv, 1), "%, sugiriendo una\n")
if (cv > 30) {
  cat("dispersión alta en los salarios (distribución heterogénea).\n")
} else if (cv > 15) {
  cat("dispersión moderada en los salarios.\n")
} else {
  cat("dispersión baja en los salarios (distribución homogénea).\n")
}
cat("El 50% central de los salarios se encuentra entre", format(round(cuartiles[1], 0), big.mark = ","),
    "y", format(round(cuartiles[3], 0), big.mark = ","), "USD.\n\n")

# ============================================================================
# PUNTO 8: DIAGRAMA DE CAJA Y BIGOTES - OCUPACIÓN vs SALARIO ANUAL
# ============================================================================
cat("================================================================\n")
cat("PUNTO 8: DIAGRAMAS DE CAJA Y BIGOTES - OCUPACIÓN vs SALARIO\n")
cat("================================================================\n\n")

# Resumen por ocupación
cat("Resumen de Salario Anual por Ocupación:\n\n")
resumen_ocup <- aggregate(SalarioAnual ~ OcupacionCat, data = datos, FUN = function(x) {
  c(n = length(x),
    media = round(mean(x), 0),
    mediana = round(median(x), 0),
    min = min(x),
    max = max(x),
    desv = round(sd(x), 0))
})
resumen_final <- do.call(data.frame, resumen_ocup)
names(resumen_final) <- c("Ocupacion", "n", "Media", "Mediana", "Min", "Max", "Desv.Est")
print(resumen_final, row.names = FALSE)
cat("\n")

# Diagrama de caja y bigotes
png("output/08_boxplot_ocupacion_salario.png", width = 900, height = 600)
par(mar = c(8, 5, 4, 2))
boxplot(SalarioAnual ~ OcupacionCat, data = datos,
        col = c("#E74C3C", "#3498DB", "#2ECC71", "#F39C12", "#9B59B6", "#1ABC9C"),
        main = "Salario Anual por Tipo de Ocupación",
        xlab = "",
        ylab = "Salario Anual (USD)",
        las = 2,
        cex.main = 1.3,
        cex.lab = 1.1,
        cex.axis = 0.9,
        outline = TRUE)
abline(h = mean(datos$SalarioAnual), col = "red", lty = 2, lwd = 1.5)
legend("topright",
       legend = paste("Media general =", format(round(mean(datos$SalarioAnual), 0), big.mark = ",")),
       col = "red", lty = 2, lwd = 1.5, cex = 0.9)
dev.off()
cat("Gráfico guardado: output/08_boxplot_ocupacion_salario.png\n")

# Comentario
cat("\nComentario: Los diagramas de caja y bigotes permiten comparar la distribución\n")
cat("del salario anual entre las diferentes ocupaciones. Se pueden identificar:\n")
cat("- Diferencias en la mediana salarial entre ocupaciones\n")
cat("- La dispersión (variabilidad) de salarios dentro de cada ocupación\n")
cat("- La presencia de valores atípicos (outliers)\n")
cat("- Qué ocupaciones tienen salarios más altos o más homogéneos\n\n")

cat("================================================================\n")
cat("ANÁLISIS COMPLETADO EXITOSAMENTE\n")
cat("Gráficos guardados en la carpeta: output/\n")
cat("================================================================\n")
