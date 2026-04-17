# Interpretaciones del Análisis Estadístico
## Entidad Financiera - 60 Clientes

---

## Punto 1: Descripción de la Población de Interés

La población de interés está conformada por los **60 clientes** de una entidad financiera
(banco). El análisis busca caracterizar el comportamiento de estos clientes a partir de
tres variables: salario anual en dólares, tipo de industria y ocupación laboral. El
propósito es ofrecer productos y servicios bancarios personalizados para todos los
clientes o segmentos específicos de ellos.

---

## Punto 2: Clasificación de las Variables

- **X1 - Salario Anual (Dólares):** Variable **cuantitativa continua**, medida en escala
  de **razón**. Posee un cero absoluto significativo y permite todas las operaciones
  aritméticas. Sus valores pueden tomar cualquier número real positivo dentro del
  rango observado.

- **X2 - Tipo de Industria:** Variable **cualitativa nominal**. Sus categorías
  (0=Otra, 1=Manufactura, 2=Construcción) representan clasificaciones sin orden
  jerárquico natural. Solo permite operaciones de igualdad/desigualdad.

- **X3 - Ocupación:** Variable **cualitativa nominal**. Las seis categorías
  (0=Otro, 1=Administrador, 2=Ventas, 3=Operario de oficina, 4=Servicios generales,
  5=Ingeniero) representan distintas funciones laborales sin orden intrínseco.

---

## Punto 3: Tabla de Frecuencias y Diagrama Circular - Ocupación

La distribución de los clientes por ocupación revela que la categoría con mayor
representación es **Ingeniero** (26.7%), seguida de **Operario de oficina** (20.0%).
Las categorías de **Administrador** (16.7%), **Otro** (15.0%) y
**Servicios generales** (15.0%) muestran proporciones similares. **Ventas** es la
categoría con menor representación (6.7%).

El diagrama circular confirma visualmente que más de la mitad de los clientes se
concentran en solo dos ocupaciones (Ingeniero y Operario de oficina), lo que sugiere
que la entidad financiera atiende principalmente a profesionales técnicos y operativos.
Esto es relevante para el diseño de productos financieros específicos: por ejemplo,
créditos de vivienda para ingenieros con salarios más estables, o microcréditos para
operarios de oficina.

---

## Punto 4: Tabla de Frecuencias y Diagrama de Barras - Industria

La distribución por tipo de industria muestra un balance relativo entre los tres
sectores: **Manufactura** lidera con el 38.3% de los clientes, seguida de **Otra**
con el 36.7%, y **Construcción** con el 25.0%.

El diagrama de barras confirma que no existe una dominancia clara de un solo sector,
lo que indica que la cartera de clientes de la entidad financiera está
**diversificada**. Esta diversificación es favorable para la gestión de riesgo
crediticio, ya que una recesión en un sector particular no afectaría a la mayoría de
los clientes. Sin embargo, el sector Construcción, al tener menor representación,
podría ser un segmento objetivo para estrategias de captación.

---

## Punto 5: Tabla de Frecuencias e Histograma - Salario Anual

Aplicando la regla de Sturges, se determinaron 7 clases para agrupar los datos.
El histograma muestra una distribución **asimétrica positiva** (sesgada a la derecha):

- La mayor concentración de salarios se encuentra en los intervalos de
  $17,000 a $50,000 USD, que agrupa aproximadamente al 70% de los clientes.
- La media (~$43,265 USD) es mayor que la mediana (~$39,580 USD), lo cual
  es una característica típica de distribuciones con asimetría positiva.
- Existen algunos clientes con salarios notablemente superiores al promedio
  (entre $70,000 y $95,000 USD), que forman la cola derecha de la distribución.

Esta distribución es consistente con lo observado en poblaciones laborales reales,
donde la mayoría de los trabajadores tienen salarios moderados y una minoría percibe
ingresos significativamente más altos.

---

## Punto 6: Tabla Cruzada y Barras Apiladas - Ocupación x Industria

La tabla de contingencia revela patrones interesantes en la relación entre
ocupación e industria:

- Los **Ingenieros** se concentran principalmente en los sectores "Otra" y
  "Manufactura", con menor presencia en Construcción.
- Los **Operarios de oficina** se distribuyen de manera relativamente uniforme
  entre los tres sectores.
- **Ventas** no tiene representación en el sector Construcción, concentrándose
  en Otra y Manufactura.
- **Administradores** muestran presencia equilibrada en los tres sectores.
- La categoría **Otro** está más presente en Manufactura y Construcción que
  en el sector "Otra".

El diagrama de barras apiladas permite visualizar estas relaciones de forma clara.
La entidad financiera puede usar esta información para diseñar estrategias de
marketing y productos financieros segmentados por la combinación ocupación-industria.

---

## Punto 7: Resumen Estadístico - Salario Anual

### Medidas de Tendencia Central

- **Media aritmética (~$43,265 USD):** Representa el salario promedio del conjunto
  de clientes. Sin embargo, al ser sensible a valores extremos, se ve influenciada
  por los salarios más altos.
- **Mediana (~$39,580 USD):** El 50% de los clientes gana por debajo de este valor.
  Al ser menor que la media, confirma la asimetría positiva de la distribución.
- **Moda:** El valor que se repite con mayor frecuencia. En distribuciones continuas
  con muchos valores únicos, la moda puede no ser representativa.

La diferencia entre media y mediana (media > mediana) es un indicador claro de que
la distribución está sesgada a la derecha, con algunos salarios altos que elevan el
promedio.

### Medidas de Posición

- **Q1 (~$29,518 USD):** El 25% de los clientes gana por debajo de este valor.
- **Q2 (~$39,580 USD):** Coincide con la mediana.
- **Q3 (~$52,669 USD):** El 75% de los clientes gana por debajo de este valor.
- **Rango intercuartílico (IQR ~$23,151 USD):** Contiene el 50% central de los datos.
  Es una medida de dispersión robusta, no afectada por valores extremos.

Los deciles y percentiles permiten una segmentación más fina. Por ejemplo, el P90
(~$67,372 USD) indica que solo el 10% de los clientes gana más de esa cantidad,
identificando un segmento de clientes premium.

### Medidas de Dispersión

- **Rango (~$77,750 USD):** Diferencia entre el salario máximo y mínimo. Es
  sensible a valores extremos.
- **Desviación estándar (~$18,761 USD):** Los salarios se desvían en promedio
  ~$18,761 del salario promedio.
- **Coeficiente de variación (~43.4%):** Al ser mayor al 30%, indica una
  **distribución heterogénea**. Los salarios de los clientes son muy variables,
  lo que justifica la necesidad de segmentar la cartera para ofrecer productos
  diferenciados.

### Medidas de Forma

- **Asimetría (~0.92):** Valor positivo mayor que 0.5, confirma una distribución
  **asimétrica positiva** (sesgada a la derecha). Hay más clientes con salarios
  bajos/moderados que con salarios altos.
- **Curtosis (~3.55):** Valor mayor que 3 indica una distribución **leptocúrtica**,
  con colas más pesadas que la distribución normal. Esto significa que hay una mayor
  probabilidad de encontrar valores extremos (tanto muy altos como muy bajos)
  comparado con una distribución normal.

---

## Punto 8: Diagramas de Caja y Bigotes - Ocupación vs Salario Anual

Los diagramas de caja y bigotes permiten comparar visualmente la distribución
salarial entre las distintas ocupaciones:

- **Ventas** presenta la mediana más alta y la mayor dispersión (caja más amplia),
  indicando salarios más variables y generalmente más altos en este grupo. Esto
  podría deberse a comisiones y bonificaciones variables.

- **Operario de oficina** muestra la mediana más baja, sugiriendo que estos
  profesionales tienden a percibir los salarios más bajos de la muestra. La
  distribución es relativamente compacta.

- **Administrador** presenta una distribución compacta alrededor de la media
  general, con salarios más homogéneos y predecibles.

- **Ingeniero** muestra una distribución amplia, reflejando la diversidad de
  especialidades y niveles de experiencia en esta categoría.

- **Servicios generales** tiene alta variabilidad salarial, posiblemente debido
  a la diversidad de roles que abarca esta categoría.

- **Otro** presenta una distribución moderada con al menos un valor atípico
  en el extremo superior.

- La **media general** (~$43,265 USD) sirve como referencia para identificar
  qué ocupaciones están por encima o por debajo del promedio.

### Recomendaciones para la Entidad Financiera

1. **Clientes premium (P90+):** Diseñar productos de inversión y banca
   privada para el 10% de clientes con salarios superiores a ~$67,000 USD.
2. **Segmento medio (Q1-Q3):** Ofrecer productos estándar como tarjetas de
   crédito, préstamos personales y cuentas de ahorro.
3. **Segmento bajo (<Q1):** Desarrollar productos de microcrédito e
   inclusión financiera para clientes con salarios inferiores a ~$29,500 USD.
4. **Por ocupación:** Considerar productos especializados como créditos
   hipotecarios con tasas preferenciales para ingenieros y administradores,
   y líneas de crédito flexibles para personal de ventas.
