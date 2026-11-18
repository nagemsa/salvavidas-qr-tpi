# 🚑 SalvaVidas QR — Sistema de Identificación Médica de Emergencia para Conductores

**Proyecto para Taller de Procesos Interdisciplinarios (TPI)**  
**Arquitectura:** Monolito Modular con **Domain-Driven Design (DDD)** y **Clean Architecture (Hexagonal / Puertos y Adaptadores)**  
**Stack Cloud-Económico de Alto Rendimiento:** **TypeScript nativo sobre Node.js 22 LTS** (`node:http`, `node:sqlite` en modo WAL, `node:crypto`, `node:zlib`, `node:test`) con **0 dependencias externas (`node_modules` = 0 bytes)**.

---

## 1. ¿Qué Información es Vital en un Accidente de Tránsito? (Criterio Prehospitalario - "La Hora Dorada")

Cuando un conductor sufre un siniestro vial y se encuentra inconsciente, en estado de choque o con trauma craneoencefálico, los paramédicos (APH) y primeros respondientes disponen de segundos para tomar decisiones críticas. **SalvaVidas QR** estructura la información en 4 niveles de prioridad clínica:

| Nivel de Prioridad | Información Vital Seleccionada | Impacto Clínico en Escena / Urgencias |
| :--- | :--- | :--- |
| **1. Triage de 3 Segundos (Alertas Rojas)** | • **Uso de Anticoagulantes** (Warfarina, Rivaroxabán, Apixabán, Clopidogrel)<br>• **Alergias Anafilácticas a Fármacos** (Penicilina, AINEs/Ketorolaco, Dipirona, Látex, Yodo)<br>• **Grupo Sanguíneo y Factor Rh** (`O-`, `A-`, etc.) | • Alerta sobre riesgo letal de **hemorragia interna/intracraneal oculta**.<br>• Evita administrar analgésicos o antibióticos en ambulancia que desencadenen un choque anafiláctico.<br>• Prepara transfusión segura (`O-` solo recibe `O-`). |
| **2. Condiciones y Dispositivos Ocultos** | • **Diabetes Insulinodependiente**<br>• **Epilepsia / Convulsiones**<br>• **Marcapasos / Desfibrilador Implantable (DAI)**<br>• **Embarazo / Hemofilia** | • Evita confundir un coma hipoglucémico con un trauma craneal (indica glucometría inmediata).<br>• Indica precaución al ubicar parches de desfibrilación y contraindicación de resonancia magnética. |
| **3. Cinemática Vehicular y Logística Hospitalaria** | • **Tipo de Vehículo y Placa** (Protocolo de Casco en Motociclistas)<br>• **EPS / Aseguradora, Clínica Preferida y Póliza SOAT**<br>• **Condición de Donante de Órganos** | • En motociclistas, instruye inmovilización cervical bimanual y no retirar el casco sin técnica de 2 operadores.<br>• Acelera la remisión al centro de trauma con convenio activo. |
| **4. Red de Apoyo y Bitácora** | • **Contactos de Emergencia con Llamada en 1 Toque (`tel:`) y WhatsApp SOS**<br>• **Bitácora de Escaneo con Coordenadas GPS** | • Permite avisar inmediatamente al familiar primario y deja trazabilidad de qué unidad médica atendió al paciente y dónde. |

---

## 2. Formatos Nativos de Impresión (`.pdf`, `.png` 300 DPI y `.svg`)

- **`GET /api/emergency/:token/kit.pdf`**: Genera un documento **PDF 1.4 vectorial A4** con el **Sticker de Casco/Parabrisas** y el **Carnet Plegable de Billetera** listo para litografía o impresora láser.
- **`GET /api/emergency/:token/qr.png`**: Genera una imagen **PNG de alta resolución (300 DPI, 11811 px/m)** para rotulación adhesiva o documentos Word/Canva.
- **`GET /api/emergency/:token/qr.svg`**: Genera el código QR en formato vectorial escalable ISO/IEC 18004.

---

## 3. Ejecución Rápida y Pruebas

```bash
npm test
npm start
```
