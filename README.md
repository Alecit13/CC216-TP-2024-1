# Introducción 
Este análisis explora la demanda de dos tipos de hoteles, urbano y resort, utilizando datos pre
pandemia para identificar patrones en los perfiles de las personas que hacen reservaciones, la
demanda por tipo de habitación y los canales de reserva más utilizados, entre otros aspectos. Al
comparar estos datos con tendencias actuales post pandemia, podemos obtener insights
valiosos sobre cómo han cambiado las preferencias y comportamientos de los clientes.
# Objetivo
Realizar un análisis exploratorio de un conjunto de datos (EDA), creando visualizaciones,preparando los datos y obteniendo inferencias básicas utilizando R/RStudio como herramienta desoftware.
# Integrantes
- Carbajal Rojas Andrés Eduardo<br>
- Cuadros Contreras Freddy Alejandro<br>
- Guija Solis Juan Pablo Julian<br>
- Quintana Noa Jimena Alexsandra<br>
- Joaquin Sebastian Ruiz Ramirez<br>
# Descripción Dataset
Conjunto de Datos 
Por el análisis exploratorio de datos visto en el punto 3, entendemos que cada variable representa lo siguiente:<br>
|Nombre|Descripción|
|------|-----------|
|`hotel`|Indica el tipo de hotel al que se refiere la reserva. Puede ser "Resort Hotel" o "City Hotel".|
|`is_canceled`|Es una variable binaria que indica si la reserva fue cancelada (1) o no (0).|
|`lead_time`| Representa el tiempo en días desde la fecha de la reserva hasta la fecha de llegada al hotel. Es una medida de cuánto tiempo antes se realizó la reserva.|
|`arrival_date_year`| Representa el año de llegada al hotel.|
|`arrival_date_month`| Representa el mes de llegada al hotel.|
|`arrival_date_week_number`| Representa el número de semanas del año de llegada al hotel.|
|`arrival_date_day_of_month`| Representa el día del mes de llegada al hotel.|
|`stays_in_weekend_nights`| Indica el número de noches de estancia durante los fines de semana (sábado o domingo).|
|`stays_in_week_nights`|Indica el número de noches de estancia durante los días de semana (de lunes a viernes).|
|`adults`|Representa el número de adultos incluidos en la reserva.|
|`children`|Representa el número de niños incluidos en la reserva.|
|`babies`|Representa el número de bebés incluidos en la reserva.|
|`meal`| Indica el tipo de comida reservada, como "BB" (Bed & Breakfast), "HB" (Half Board), "FB" (Full Board), "SC" (Self Catering) o "Undefined" (Sin definir).|
|`country`|Representa el país de origen del cliente.|
|`market_segment`| Indica el segmento de mercado al que pertenece la reserva, como "TA" (Travel Agents), "TO" (Tour Operators), etc.|
|`distribution_channel`|Indica el canal de distribución de la reserva, como "Directo", "Agencia", etc.|
|`is_repeated_guest`|Es una variable binaria que indica si el huésped ha realizado reservas previas en el hotel (1) o no (0).|
|`previous_cancellations`| Indica el número de reservas previas que fueron canceladas por el cliente antes de la reserva actual.|
|`previous_bookings_not_canceled`| Indica el número de reservas previas que no fueron canceladas por el cliente antes de la reserva actual.|
|`reserved_room_type`| Representa el tipo de habitación reservada.|
|`assigned_room_type`| Representa el tipo de habitación asignada al cliente en el momento del check-in.|
|`booking_changes`|Representa el número de cambios realizados a la reserva desde el momento de la reserva hasta el momento del check-in o cancelación.|
|`deposit_type`|Indica el tipo de depósito realizado para garantizar la reserva.|
|`agent`|Representa el ID de la agencia de viajes que realizó la reserva.|
|`company`| Representa el ID de la empresa que realizó la reserva.|
|`days_in_waiting_list`| Indica el número de días que la reserva estuvo en lista de espera antes de ser confirmada al cliente.|
|`customer_type`|Indica el tipo de cliente, como "Transient", "Contract", "Group", etc.|
|`adr (Average Daily Rate)`| Representa la tarifa diaria promedio calculada dividiendo la suma de todas las transacciones de alojamiento por el número total de noches de estancia.|
|`required_car_parking_spaces`|Indica el número de plazas de aparcamiento requeridas por el cliente.|
|`total_of_special_requests`|Indica el número total de peticiones especiales hechas por el cliente.|
|`reservation_status`| Indica el último estado de la reserva, como "Canceled", "Check-Out", "No-Show", etc.|
|`reservation_status_date`| Representa la fecha en la que se estableció el último estado de la reserva|
# Conclusiones
Preferencia del hotel: Los clientes tienden a preferir los hoteles de ciudad. Lo que puede indicar que los viajes de negocios o las visitas a las áreas urbanas son más comunes que las vacaciones en destinos más rurales o aislados.<br>
Temporada de reservas: La temporada baja ocurre durante los meses de noviembre, diciembre, enero y febrero.<br>
Cancelaciones de reservas: Los meses con más cancelaciones son agosto y julio.<br>
Necesidad de estacionamiento: Se necesitan como mínimo 4 estacionamientos por hotel. Lo que sugiere que muchos clientes optan por alquilar un auto durante su estancia.<br>
Familia: La mayoría de las reservas no incluyen a familias con niños o bebés. Lo que llega a indicar que los viajes en solitario o en pareja son más comunes.	<br>	

<h2>Licencia</h2>
