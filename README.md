Desarrolle esta app como un portafolio personal hecho en Flutter, organizado en varias pantallas (screens) y widgets reutilizables. 

## Estructura general de mi portafolio

- **main.dart**: Es el punto de entrada de la app. Aquí se configura el tema, el título, la ruta inicial (`'/'`) y todas las rutas disponibles usando un mapa centralizado en `AppRoutes.routes`.
- **app_routes.dart**: Define el mapa de rutas, asociando cada string (como `'/about'`, `'/contact'`, etc.) con la pantalla correspondiente.
- **themes/app_theme.dart**: Define los colores y estilos globales de la app.
- **screens/**: Carpeta donde están todas las pantallas principales (About, Contact, Hobbies, Profile, Home).
- **widgets/**: Carpeta con componentes reutilizables como los carouseles de imágenes y la barra de app personalizada.

---

## Navegación

- La pantalla principal es **HomeScreen**.
- Desde HomeScreen puedes navegar a las otras pantallas usando los botones grandes (tipo círculo) que usan `Navigator.pushNamed(context, '/about')` y similares.
- Las rutas están centralizadas, así que si cambias el nombre de una ruta, debes hacerlo tanto en el botón como en el mapa de rutas.

---

## Pantalla Principal (HomeScreen)

- Muestra una foto mia, nombre y una breve descripción.
- Hay un **GridView** con botones circulares para navegar a:
  - ¿Quién soy? (`/about`)
  - ¿Qué hago? (`/profile`)
  - Hobbies (`/hobbies`)
  - Contacto (`/contact`)
- Abajo hay un reproductor de música con controles para cambiar de canción y pausar/reproducir.
- Un texto sobre mis gustos musicales.

---

## Pantallas Secundarias

### AboutScreen
- Presenta información sobre mi, mi carrera y una frase motivacional.
- Incluye un carrusel de imágenes mias, con flechas para navegar y un subtítulo.
- Un botón grande para volver al inicio.

### ProfileScreen
- Explica mi experiencia laboral y habilidades.
- Incluye un carrusel de imágenes relacionadas con mis trabajos.
- Un botón grande para volver al inicio.

### HobbiesScreen
- Describe mis hobbies y gustos personales (como persona, pokemon, etc).
- Incluye un carrusel de imágenes de tus colecciones y aficiones.
- Un botón grande para volver al inicio.

### ContactScreen
- Muestra mis datos de contacto (nombre, email, GitHub).
- Una imagen con mi firma digital y personal.
- Un easter egg chistoso
- Un botón grande para volver al inicio.

---

## Widgets Reutilizables

- **Carouseles**: Cada pantalla tiene su propio widget de carrusel, que muestra imágenes y descripciones, con navegación por flechas y un indicador de página.
- **MusicPlayerWidget**: Permite reproducir y cambiar entre varias canciones locales (aunque solo esta en la pantalla principal).
- **CustomAppBar**: Una barra de app personalizada que incluye un acceso rápido a la pantalla de contacto (se encuentra en una esquina en la parte superior de la pantalla)

---

## Flujo de la app

1. **Inicio**: Abres la app y ves la pantalla principal con mi foto, descripción y botones.
2. **Navegación**: Pulsas un botón y navegas a la pantalla correspondiente (Sobre mi, Perfil, Hobbies, Contacto).
3. **Interacción**: En cada pantalla puedes ver información, imágenes en carrusel y volver al inicio con un botón grande.
4. **Reproductor**: Puedes escuchar música desde la pantalla principal y que se sigue reproduciendo aunque pases a otra pantalla.

---
Eso es todo, espero le guste XD
