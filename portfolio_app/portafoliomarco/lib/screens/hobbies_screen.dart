import 'package:flutter/material.dart';
import '../widgets/hobbies_carousel.dart';

class HobbiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hobbies')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Me gustan los juegos de Pokémon, los videojuegos, el anime y en especial la saga Persona. Mi protagonista favorito es Makoto Yuki de Persona 3, porque su personalidad tranquila y decidida me transmite una fuerza silenciosa. Su manera de enfrentarse a todo, sin decir mucho pero haciendo lo necesario, me inspira bastante.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Text(
              'Jugar, ver anime, editar videos y escuchar música son mis pasatiempos favoritos.',
              style: TextStyle(fontSize: 15, color: Colors.grey[600], fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            HobbiesCarousel(),
            SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.home, size: 28),
                label: Text(
                  'Volver al inicio',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
