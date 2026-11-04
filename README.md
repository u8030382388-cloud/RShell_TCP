# ReverseTCP

**Herramienta experimental de generación de payloads multiplataforma mediante Metasploit Framework.**

## Descripción

ReverseTCP es una herramienta experimental desarrollada en Bash que utiliza Metasploit Framework para generar archivos de payload de diferentes plataformas.

Su interfaz funciona desde la terminal y permite introducir parámetros y seleccionar un sistema operativo para identificar el formato correspondiente.

## Características

- Interfaz de terminal personalizada.
- Banner ASCII mediante Figlet.
- Firma personalizada con degradado RGB.
- Instalación de dependencias mediante Pacman.
- Selección de plataforma.
- Validación de la entrada del sistema operativo.
- Generación de archivos en diferentes formatos.
- Gestión de la señal `Ctrl+C`.
- Mensajes de estado y finalización.

## Plataformas contempladas

| Sistema | Formato de salida |
|---|---|
| Windows | `.exe` |
| GNU/Linux | `.elf` |
| macOS | `.macho` |
| iOS | `.macho` |
| Android | `.apk` |

## Dependencias

- Bash
- Python 3
- Figlet
- Metasploit Framework

**Sistema previsto:** Arch Linux y distribuciones compatibles con Pacman.

## Funcionamiento general

1. Instala las dependencias indicadas.
2. Muestra la interfaz de terminal.
3. Solicita los parámetros de entrada.
4. Comprueba la selección de plataforma.
5. Ejecuta el generador correspondiente de Metasploit.
6. Muestra el mensaje de finalización.
7. Permite salir mediante `Ctrl+C`.

## Seguridad y uso responsable

ReverseTCP es un proyecto experimental de ciberseguridad con capacidades de doble uso.

Su evaluación debe limitarse a laboratorios aislados y dispositivos propios o expresamente autorizados.

No debe utilizarse para acceder a dispositivos ajenos.

## Autor

**Elpíxel**

Proyecto personal desarrollado en Bash con fines de aprendizaje y experimentación en Linux.

---

*Linux, Bash & Cybersecurity.*

**By Elpíxel**
