# PRD — Fuente de laboratorio DIY (20261121-1)

| Campo | Valor |
|---|---|
| Proyecto | 20261121-1 Fuente de laboratorio |
| Revisión | revA (en definición) |
| Fecha | 2026-11-21 |
| Estado | Borrador — pendientes de medición y de decisión abiertos (ver §10 y §11) |

## 1. Objetivo

Construir una fuente de alimentación de laboratorio de nivel profesional (seguridad, acabado y precisión), reutilizando el transformador rectangular disponible. Salidas: una variable con limitación de corriente y dos rieles fijos (±12 V y 5 V).

## 2. Alcance

**Incluye:** diseño eléctrico (esquemático y PCB), diseño mecánico (gabinete, panel frontal, gestión térmica), verificación y puesta en marcha.

**No incluye (revA):** control digital, comunicación remota, display con microcontrolador. Si se agrega un µC, se crea `firmware/` con su propio requisito.

**Descartado:** transformador toroidal (decisión del usuario: se diseña solo con el rectangular). Objetivo original 0–30 V / 2 A: **no alcanzable** con este trafo (ver §5).

## 3. Requisitos de salida

| ID | Salida | Rango | Corriente | Referencia |
|---|---|---|---|---|
| OUT-1 | Variable | 0–25 V | 0,9 A, con limitación de corriente ajustable | Devanado 13-0-13 V |
| OUT-2 | ±12 V (con 0 central) | ±12 V | 0,3 A por riel | Devanado 12-0-12 V |
| OUT-3 | 5 V | 5 V | 0,3 A | Ver decisión D1 |

Notas:
- OUT-1 debe llegar a 0 V (hace falta un riel negativo auxiliar de −1,2 a −5 V para el LM317, o un lazo con op-amp).
- Límite de corriente de OUT-1 ajustable con tope en 0,9 A–1,0 A (techo del trafo).
- OUT-2 y OUT-3 con limitación o protección contra cortocircuito.

## 4. Supuestos de alimentación

- Red nominal **230 V asegurada** (el diseño se verificó también con 220 V como mínimo).
- Límite superior de red a considerar: +10 % (253 V). En vacío con 230 V la tensión continua del filtro de 13 V es 38,9 V, y 42,9 V a 253 V.
- Por debajo del mínimo el fallo es benigno: los reguladores pierden regulación (aparece rizado), sin daño.

## 5. Base: transformador rectangular (mediciones)

| Parámetro | Valor |
|---|---|
| Secundarios | 13-0-13 V / 1,9 A y 12-0-12 V / 1,3 A (≈ 80 VA total) |
| Primario | 27,76 Ω; I0 = 40,6 mA a 228,5 V |
| Aislamiento | ≥ 100 MΩ primario↔secundarios, entre secundarios y a núcleo |
| Protección térmica | No tiene |
| Tensión en vacío (228,5 V) | 13-0: 14,55 V; 0-13: 14,44 V; 13-0-13: 29,03 V; 12-0: 13,63 V; 12-0-12: 27,27 V |

Datos de carga (puente + 4700 µF, red 228 V):

| I (A) | Vdc (V) | Rizado pp (V) |
|---|---|---|
| 0 | 38,55 | ≈ 0 |
| 0,343 | 35,89 | 0,53 |
| 0,653 | 33,97 | 0,956 |
| 0,97 | 32,83 | 1,36 |
| 1,914 | 29,50 | 2,49 |

Conclusiones de ingeniería:
- Corriente continua máxima del devanado de 13 V: **≈ 1,0 A** (Irms ≈ 1,8 × Idc; a 1,914 A, Irms ≈ 3,4 A, 1,8 × la placa).
- Modelo para simulación (13-0-13 completo): R serie = 1,35–1,37 Ω, fuente 28,3 V rms con diodos de 0,7 V (o 29,03 V con caídas de 2,45 V en total).
- 12-0-12 V: medición a 0,16 A y 0,338 A solamente; el capacitor real del ensayo no está confirmado (rizado compatible con 1,2–2,4 mF aparentes). Ver §10.

## 6. Arquitectura

Todo el cálculo usa la red a 230 V y la caída total del regulador de 3,6 V (3 V del LM317 + ≈ 0,6 V del sensado de corriente).

| Bloque | Definición |
|---|---|
| Entrada | Conector IEC con fusible y filtro; interruptor bipolar; tierra de protección al chasis |
| Pre-rectificación OUT-1 | Puente + 4700 µF/63 V sobre 13-0-13 |
| Conmutación de devanado | Relé SPDT: media devanado (≈ 14,5 Vac) para Vout < ≈ 10 V y devanado completo para el resto, con histéresis. Solo reduce la disipación (36 W → ≈ 26 W; en cortocircuito ≈ 16–18 W). Debe fallar en modo mitad |
| Regulación OUT-1 | LM317 (HV recomendado) o op-amp, con transistor de paso en disipador. Sensado de corriente y lazo de limitación |
| Riel negativo auxiliar | −1,2 a −5 V, derivado del devanado de 12 V |
| ±12 V | Rectificación con 4700 µF por riel y LDO de ≈ 0,5–0,7 V (LM2940-12 positivo, LM2990-12 negativo o equivalentes). **Sin 7812/7912** |
| 5 V | Buck desde el riel +12 V (ver D1) |

## 7. Presupuesto de tensión (caída de regulador incluida)

| Salida | Vdc mín a 230 V | Vout máx | Margen |
|---|---|---|---|
| OUT-1, 0,9 A | 32,7 V | ≈ 29,1 V | +4,1 V sobre 25 V |
| OUT-1, 1,0 A | 32,3 V | ≈ 28,7 V | — |
| OUT-2, 0,3 A | 14,9 V | ≈ 14,2 V (LDO 0,7 V) | +2,2 V sobre 12 V |
| +12 V a 0,45 A (con OUT-3) | ≈ 13,4 V | ≈ 12,7 V | +0,7 V |

Con red a 220 V: OUT-1 da 27,7 V a 0,9 A y OUT-2 da 13,5 V a 0,3 A.

## 8. Seguridad

- Aislamiento galvánico por el trafo; ≥ 100 MΩ medido. Verificar con megóhmetro a 500 V antes del montaje final.
- Fusible primario de acción lenta (valor a definir con la corriente de arranque; I0 = 40,6 mA, 80 VA ⇒ ≈ 0,35 A de plena carga).
- Fusible térmico en el trafo (no tiene protección integrada).
- Tierra de protección en el chasis y las partes metálicas accesibles.
- Cableado de red con distancia de fuga y aislación reforzada, con termocontraíble y sujeción mecánica.
- Protecciones de salida: limitación de corriente en OUT-1, cortocircuito en OUT-2 y OUT-3.
- Si el sensado de corriente o el relé fallan: modo mitad y corriente limitada (estado seguro).

## 9. Mecánica, térmica y acabado

- Transistor de paso de OUT-1: con conmutación de devanado disipa hasta ≈ 26 W y exige disipador ≤ 1,4 °C/W; sin conmutación llega a ≈ 36 W (cortocircuito, red alta) y exige ≤ 1,0 °C/W. En ambos casos con ventilación.
- Separar alta y baja tensión en el gabinete; flujo de aire definido.
- Panel frontal ergonómico: bornes tipo banana, perillas de tensión y corriente, indicación de limitación de corriente y displays.
- Cableado con conectores, bridas y termocontraíble; serigrafía casera.

## 10. Verificación y criterios de aceptación

| # | Prueba | Criterio |
|---|---|---|
| T1 | OUT-1 a 25 V / 0,9 A, red 230 V | Regula con rizado de salida bajo (a definir) |
| T2 | Barrido 0–25 V a 0,9 A | Sin pérdida de regulación |
| T3 | Cortocircuito de OUT-1 | Corriente limitada al valor fijado, sin daño, temperatura del transistor de paso dentro de la SOA |
| T4 | OUT-2 a ±0,3 A | ±12 V ± tolerancia del LDO |
| T5 | OUT-3 a 0,3 A | 5 V dentro de tolerancia |
| T6 | **Térmico con las tres salidas cargadas a la vez, 30 min** | Superficie del trafo ≤ 80 °C |
| T7 | Aislamiento a 500 V DC | ≥ 100 MΩ |
| T8 | Conmutación de devanado | Sin transitorios en la salida, histéresis correcta |

## 11. Pendientes de medición

1. Riel +12 V a 0,45 A con 4700 µF reales: Vdc, rizado y Vred.
2. Ensayo térmico de 30 min con todas las salidas cargadas (T6).
3. Irms del secundario de 13 V a ≈ 0,9 A con pinza True RMS.
4. Puente sobre media devanado (13-0) a 1 A, para definir el umbral de conmutación.
5. Corregir la planilla de mediciones: red nominal 230 V (no 228 V) y su factor de red bajo, y el capacitor real de la hoja de 12 V.

## 12. Decisiones abiertas

| ID | Decisión | Opciones |
|---|---|---|
| D1 | Origen y masa del 5 V | (a) buck desde el riel +12 V (masa común con ±12 V, variable flotante; exige 4700 µF reales por riel); (b) buck desde el bus del variable (une el 5 V al negativo del variable; pierde el aislamiento entre canales) |
| D2 | Pre-regulación de OUT-1 | Con conmutación de devanado o sin ella (disipador mayor) |
| D3 | Regulador de OUT-1 | LM317HV + transistor de paso, u op-amp discreto con transistor de potencia |

## 13. Historial

| Fecha | Rev | Cambio |
|---|---|---|
| 2026-11-21 | revA | Borrador inicial: requisitos y presupuesto de tensión con las mediciones disponibles |
