# Decision Records — 20261121-1 Fuente de laboratorio

Un archivo por decisión de diseño no trivial (componente agregado/eliminado,
cambio de topología, trade-off de costo vs. performance). Formato ADR
(Architecture Decision Record) adaptado a hardware.

## Cuándo crear una

- Se descarta un componente o approach que otro ingeniero (o vos mismo en
  6 meses) podría volver a proponer.
- Hay trade-off real entre alternativas (costo, BOM, layout, recursos de MCU).
- Un cliente podría preguntar "¿por qué no...?" en una review.

## Convención de nombre

```
NNNN-slug-corto.md
```

Numeración secuencial, nunca se reutiliza ni se borra. Si una decisión se
revierte, se crea un ADR nuevo con estado "Supera a ADR-NNNN", no se edita
el original.

## Plantilla

```markdown
# NNNN — Título en infinitivo

Estado: Propuesta / Aceptada / Superada por ADR-NNNN — YYYY-MM-DD

## Contexto
## Decisión
## Alternativas consideradas
## Consecuencias
```

## Índice

| ADR | Título | Estado |
|---|---|---|
