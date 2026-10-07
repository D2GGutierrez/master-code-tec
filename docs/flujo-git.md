# Flujo de trabajo con Git — MASTER CODE

Reglas para que el repositorio quede ordenado, cada cambio tenga un responsable y todo el equipo pueda explicar el código que entrega.

## 1. Ramas

| Rama | Para qué sirve | Quién escribe en ella |
| :--- | :--- | :--- |
| `main` | Lo que se presenta al final de cada sprint. Siempre funciona. | Nadie directamente: solo por Pull Request desde `develop` al cerrar el sprint. |
| `develop` | Integración del sprint en curso. | Nadie directamente: solo por Pull Request desde una rama de tarea. |
| `feat/hu02-t1-simplejwt-rs256` | Una tarea nueva. | La persona asignada a esa tarea. |
| `fix/hu02-login-mensaje-error` | Corrección de un error. | Quien lo corrige. |
| `docs/hu04-t1-hash-contrasenas` | Solo documentación. | Quien la escribe. |

Nombre de la rama: `tipo/hu<número>-t<número>-descripcion-corta`, en minúsculas y con guiones. El número de HU y de tarea es el del documento `docs/historias-tareas.md` (HU 1, T1, etc.). Una rama = una tarea. Si una tarea se alarga, se divide en dos tareas y dos ramas.

## 2. Ciclo de una tarea

1. Mover la tarjeta en Trello a «En progreso».
2. Actualizar y crear la rama:
   `git switch develop` → `git pull` → `git switch -c feat/hu02-t1-simplejwt-rs256`
3. Trabajar en commits pequeños, con la fecha real (no se modifica la fecha de ningún commit).
4. Antes de abrir el PR, pasar el **control de entendimiento** (sección 4).
5. Subir la rama y abrir un Pull Request hacia `develop`.
6. Otro integrante revisa. El autor no hace merge de su propio PR.
7. Merge con «Squash and merge» y borrar la rama. Mover la tarjeta a «Hecho».

## 3. Commits

Formato: `carpeta: qué hace (HU# T#)`

Ejemplos: `admin-api: modelo Docente y migración (HU1 T1)`, `user-api: verificación del JWT con JWKS (HU22 T1)`.

- Un commit = un cambio que se puede explicar en una línea.
- Se hacen manualmente (`git add` de archivos concretos, nunca `git add .` sin revisar `git status` y `git diff --staged`).
- Nunca se commitean `.env`, claves ni contraseñas.

## 4. Control de entendimiento (el paso anti-código-basura)

Antes de abrir el PR, quien hizo la tarea debe poder responder, sin mirar la IA:

1. ¿Qué hace cada archivo nuevo o modificado y por qué hace falta para la tarea?
2. ¿Qué pasa si borro este archivo o esta función? Si la respuesta es «nada», se borra.
3. ¿Cómo comprobé que funciona? (la prueba o el `curl` concreto)

Si no puede responder alguna, no se hace PR: se pide la explicación a la IA, se lee el código y se elimina lo que no se justifique. El revisor puede hacer esas mismas preguntas durante la revisión.

## 5. Pull Request

Título: igual que el commit. Descripción corta:

```
## Tarea
HU# T# — enlace a la tarjeta de Trello

## Qué cambia
(2 a 5 líneas)

## Cómo lo probé
(comandos o pasos)

## Control de entendimiento
[ ] Puedo explicar cada archivo nuevo
[ ] No hay código ni dependencias que la tarea no pida
[ ] Sin credenciales en el cambio
[ ] Las pruebas y el CI pasan
```

Revisor: confirma que el cambio hace solo lo que dice la tarea, que el CI está verde y que no sobra nada.

## 6. Protecciones en GitHub (Settings → Branches)

Para `main` y `develop`: exigir Pull Request, exigir 1 aprobación, exigir que el CI pase y bloquear el push directo.

## 7. Origen de este repositorio

Este repositorio empezó vacío al inicio del Sprint 1, para aplicar desde el primer commit las reglas de este documento. La versión anterior se conserva sin cambios en `master-code-v0`.

El primer commit del repositorio es el único que se hace directo en `main`; el resto entra por Pull Request. Todos los commits conservan su fecha real: no se reescribe el historial ni se modifican las fechas.

## 8. Quién toca qué

| Integrante | Carpetas |
| :--- | :--- |
| Juan Diego Gutiérrez | `admin-api`, `user-api`, `ai-service` |
| Carlos Junco | `admin-web`, `user-web` |
| Gael La Jara | `mobile` y las tareas de pruebas |

Si una tarea exige tocar la carpeta de otra persona, se avisa en el PR y esa persona revisa.
