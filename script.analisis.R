# ==============================================================================
# PRÁCTICA 1 - ESTADÍSTICA DESCRIPTIVA (UAH)
# Dataset: Intervenciones del Cuerpo de Bomberos COVID-19 (Ayto. de Madrid)
# ==============================================================================

# 1. INSTALACIÓN Y CARGA DE LIBRERÍAS
if(!require(e1071)) install.packages("e1071", repos = "http://cran.us.r-project.org")
if(!require(plotly)) install.packages("plotly", repos = "http://cran.us.r-project.org")
if(!require(htmlwidgets)) install.packages("htmlwidgets", repos = "http://cran.us.r-project.org")

library(e1071)      # Para Coeficiente de Asimetría de Fisher y Curtosis
library(plotly)     # Gráfico interactivo (Actividad Extra para el 10)
library(htmlwidgets)

# 2. LECTURA Y LIMPIEZA DE DATOS
datos <- read.csv("Intervenciones bomberos COVID-19 (1).csv", sep = ";", encoding = "latin1")

# Convertir la columna duracion a numérica (reemplazando comas por puntos)
datos$duracion_num <- as.numeric(gsub(",", ".", datos$duracion))

# Filtrar subconjuntos por distrito
centro <- na.omit(subset(datos, distrito == "CENTRO")$duracion_num)
vallecas <- na.omit(subset(datos, distrito == "PUENTE VALLECAS")$duracion_num)

# 3. FUNCIÓN DE CÁLCULO DE ESTADÍSTICOS COMPLETOS (Estructura P4)
calcular_estadisticos <- function(x) {
  n <- length(x)
  media <- mean(x)
  mediana <- median(x)
  minimo <- min(x)
  maximo <- max(x)
  rango <- maximo - minimo
  varianza <- var(x)
  desv_std <- sd(x)
  cv <- desv_std / media
  q1 <- quantile(x, 0.25)
  q3 <- quantile(x, 0.75)
  iqr <- IQR(x)
  asimetria <- skewness(x, type = 2) # Asimetría de Fisher
  curtosis <- kurtosis(x, type = 2)  # Curtosis
  
  res <- c(N = n, Media = media, Mediana = mediana, Min = minimo, Max = maximo,
           Rango = rango, Varianza = varianza, DesvStd = desv_std, CV = cv,
           Q1 = q1, Q3 = q3, IQR = iqr, Asimetria = asimetria, Curtosis = curtosis)
  return(round(res, 2))
}

# Mostrar en consola la tabla estadística idéntica a la P4
cat("--- ESTADÍSTICOS DISTRITO CENTRO ---\n")
print(calcular_estadisticos(centro))

cat("\n--- ESTADÍSTICOS PUENTE DE VALLECAS ---\n")
print(calcular_estadisticos(vallecas))

# 4. DIAGRAMA DE CAJAS EN PANTALLA (Aparece en la pestaña Plots)
par(mfrow = c(1, 2)) # Dividir pantalla en 2 columnas

boxplot(centro, main = "Distrito Centro", ylab = "Horas", col = "lightblue")
abline(h = mean(centro), col = "red", lty = 2, lwd = 2) # Línea roja discontinua = Media

boxplot(vallecas, main = "Puente de Vallecas", ylab = "Horas", col = "lightgreen")
abline(h = mean(vallecas), col = "red", lty = 2, lwd = 2) # Línea roja discontinua = Media

# Guardar la imagen en el disco duro automáticamente para el informe
dev.copy(png, filename = "diagrama_cajas.png", width = 800, height = 600)
dev.off()

# 5. GENERACIÓN DEL GRÁFICO INTERACTIVO (Plotly - Extra para el 10)
fig <- plot_ly(type = 'box')
fig <- fig %>% add_boxplot(y = centro, name = "Centro", boxpoints = 'outliers')
fig <- fig %>% add_boxplot(y = vallecas, name = "Puente de Vallecas", boxpoints = 'outliers')
fig <- fig %>% layout(title = "Comparativa Interactiva de Duración de Intervenciones (Horas)")

saveWidget(fig, "grafico_interactivo.html", selfcontained = TRUE)