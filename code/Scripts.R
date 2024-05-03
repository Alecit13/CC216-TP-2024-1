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
#lead_time
ggplot(df_hotel_bookings, aes(y =adr)) +
  geom_boxplot() +
  labs(title = "Diagrama de Cajas de Lead Time",
       x = "Lead Time",
       y = "") +  
theme_minimal()
percentil_95 <- quantile(df_hotel_bookings$adr, 0.95)
df_hotel_bookings <- df_hotel_bookings %>%filter(lead_time <= percentil_95)


#adr tiene un dato atipico -6
df_hotel_bookings <- df_hotel_bookings %>%filter(adr <0)


#Guardar Datos
write.csv(df_hotel_bookings, "hotel_bookings_final.csv", row.names = FALSE)

#Visualizacion 1
library(ggplot2)

# Convertir arrival_date_month a factor y reordenarlo según el orden de los meses
df_hotel_bookings <- df_hotel_bookings %>%
  mutate(arrival_date_month = factor(arrival_date_month, levels = month.name))

# Agrupar por mes, año y hotel y contar el número de reservas
reservas_por_mes <- df_hotel_bookings %>%
  group_by(arrival_date_year, arrival_date_month, hotel) %>%
  summarise(total_reservas = n())
reservas_por_mes <- reservas_por_mes %>%
  mutate(arrival_date = as.Date(paste(arrival_date_year, arrival_date_month, "1"), format = "%Y %B %d"))

# Eliminar las columnas originales de año y mes si es necesario
reservas_por_mes <- reservas_por_mes %>%
  select(-arrival_date_year, -arrival_date_month)

ggplot(reservas_por_mes, aes(x = arrival_date, y = total_reservas, color = hotel)) +
  geom_line() +
  labs(title = "Tendencia del número de reservas por mes y hotel",
       x = "Fecha",
       y = "Número de reservas") +
  theme_minimal()

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
df_meses<-df_hotel_bookings %>% count(arrival_date_month
df_meses
 Le asignamos valores numericos a cada mes para reordenarlos despues
v_meses <- c(4,8,12,2,1,7,6,3,5,11,10,9)
df_meses$arrival_date_month <- v_meses
df_meses<-df_meses[order(df_meses$arrival_date_month),]
df_meses
#con esta informacion reorganizada generamos un grafico de lineas
ggplot(df_meses, aes(x = arrival_date_month, y = n)) +
  geom_line() +
  scale_x_continuous(breaks = seq(1, 12, 1)) +
  labs(title = "Cantidad de reservas por mes (2015-2017)",
       x = "Mes",
       y = "Número de reservas") +
  geom_hline(yintercept = c(quantile(df_meses$n, 1/3), quantile(df_meses$n, 2/3)))+
  theme_minimal()


df_meses_2015<-df_hotel_bookings[df_hotel_bookings$arrival_date_year==2015,c("arrival_date_year","arrival_date_month")]
df_meses_2015 %>%
  count(arrival_date_month)



#Visualizacion 4

reservas_por_fecha <- df_hotel_bookings %>%group_by(arrival_date_year, arrival_date_month, arrival_date_day_of_month) %>%summarise(n = n())
fecha_menor_demanda <- reservas_por_fecha %>% arrange(n)
 head(fecha_menor_demanda)
emanda de reservas se da el 13 de diciembre de 2015 con solo 19 reservas



#Visualizacion 5

ninios <- df_hotel_bookings %>% count(children)
bebes <- df_hotel_bookings %>% count (babies)
suma <- ninios$n + bebes$n
suma_sin_0 <- suma [-1]
print(suma_sin_0)
suma_columna <- sum(suma_sin_0)
print(suma_columna)

#Visualizacion 6


# Primero filtramos las reservas canceladas, ya que son irrelevantes para el análisis, luego agrupamos la cantidad de estacionamientos requeridos por el número de reservas de hotel.
estacionamiento <- df_hotel_bookings %>% filter(is_canceled != 1) %>% group_by(required_car_parking_spaces) %>% summarise(n = n())
estacionamiento
# Finalmente hacemos un gráfico de barras con etiquetas
ggplot(estacionamiento, aes(x = as.factor(required_car_parking_spaces), y = n, label = n)) +
geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  geom_text(size = 3, vjust = -0.5) +
  labs(title = "Reservas por espacios de estacionamiento requeridos",
       x = "Espacios de estacionamiento requeridos",
       y = "Número de reservas de hotel") +
  theme_minimal()


#Visualizacion 7
# Primero agrupamos los meses con las cancelaciones de reservas mediante un filtro.
cancelaciones_mes <- df_hotel_bookings %>% group_by(arrival_date_month, is_canceled) %>% summarise(cancelaciones = n()) %>% filter(is_canceled == 1)
cancelaciones_por_mes <- cancelaciones_mes %>% arrange(cancelaciones)
cancelaciones_por_mes
cancelaciones_por_mes$arrival_date_month <- factor(cancelaciones_por_mes$arrival_date_month,
                                                    levels = month.name,
                                                    ordered = TRUE)


ggplot(cancelaciones_por_mes, aes(x = arrival_date_month, y = cancelaciones)) +
  geom_col(fill = "#00abff", color = "black") +
  labs(title = "Meses en los que se producen más cancelaciones de reservas",
       x = "Mes",
       y = "Cantidad de cancelaciones") +
  theme_bw() +
  scale_x_discrete(labels = function(x) substr(x, 1, 3))
#visualizacion 8

#visualizacion 9
reservas_canceladas_por_fecha <- df_hotel_bookings %>%
  group_by(arriLoval_date_year, arrival_date_month, arrival_date_day_of_month) %>%
  summarise(total_reservas = n(),
           cancelaciones = sum(is_canceled == 1)
  )
fecha_menor_cancelada <- reservas_canceladas_por_fecha %>% arrange(cancelaciones)
 head(fecha_menor_cancelada)



