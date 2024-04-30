#Carga de Datos
df_hotel_bookings<-read.csv('hotel_bookings_original.csv',header=TRUE,stringsAsFactors = FALSE)
#Inspeccion de Datos
str(df_hotel_bookings)
head(df_hotel_bookings)
tail(df_hotel_bookings)
summary(df_hotel_bookings)
#Pre procesar datos
sin_valor <- function(x){sum = 0
for(i in 1:ncol(x)){cat("En la columna",colnames(x[i]),"total de valores NA:",colSums(is.na(x[i])),"\n")}}
sin_valor(df_hotel_bookings)
df_hotel_bookings<-na.omit(df_hotel_bookings)
summary(df_hotel_bookings$children)

#Guardar Datos
write.csv(df_hotel_bookings, "hotel_bookings_final.csv", row.names = FALSE)

#Visualizacion 1

#Visualización 2
install.packages("ggplot2")
library(ggplot2)
install.packages("dplyr")
library(dplyr)

#agrupas las reservas hechas por año en cada tipo de hotel
reservas_por_año <- df_hotel_bookings %>%group_by(arrival_date_year, hotel) %>%summarise(total_reservas=n())

# Gráfico de líneas para mostrar la tendencia del número de reservas a lo largo de los años
ggplot(reservas_por_año, aes(x = arrival_date_year, y = total_reservas, color = hotel)) +
  geom_line() +
  labs(title = "Tendencia del número de reservas por año",
       x = "Año",
       y = "Número de reservas") +
  theme_minimal()

#Visualización 3


#Visualizacion 4


#Visualizacion 5