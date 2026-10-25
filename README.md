# PL1.Estadistica-UAH
Análisis estadístico descriptivo de las intervenciones de bomberos durante el COVID-19 en Madrid - Grado en Ingeniería de Computadores (UAH).

**Asignatura:** Estadística  
**Grado:** Ingeniería de Computadores  
**Universidad:** Universidad de Alcalá (UAH)  
**Curso Académico:** 2026-2027  

## Descripción del Proyecto
Este proyecto contiene el estudio estadístico descriptivo univariante comparando la duración de las intervenciones del Cuerpo de Bomberos del Ayuntamiento de Madrid durante la pandemia de COVID-19 entre los distritos **Centro** y **Puente de Vallecas**.

## Estructura del Repositorio
* `script_analisis.R`: Código fuente en R para la limpieza de datos, cálculo de estadísticos (e1071) y generación de diagramas.
* `Intervenciones bomberos COVID-19 (1).csv`: Dataset original descargado del Portal de Datos Abiertos del Ayuntamiento de Madrid.
* `PL1-ESTADISTICA-UAH.Rproj`: Archivo del proyecto de RStudio.
* `.Rhistory`: Historial de comandos ejecutados en RStudio.
* `diagrama_cajas.png`: Gráfico estático exportado para el informe.
* `grafico_interactivo.html`: Visualización interactiva generada con la librería `plotly`.

## Requisitos e Instalación
Para ejecutar el script en RStudio, asegúrate de tener instaladas las siguientes librerías:

```R
install.packages("e1071")
install.packages("plotly")
install.packages("htmlwidgets")
