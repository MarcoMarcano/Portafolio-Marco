import 'package:flutter/material.dart';
import '../widgets/profile_carousel.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('¿Qué hago?')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'He trabajado en call centers, como cajero y también como editor de videos, lo cual me ha ayudado a desarrollar tanto habilidades de comunicación con personas como un ojo más técnico y creativo.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Text(
              'La experiencia laboral me ha permitido crecer tanto personal como profesionalmente.',
              style: TextStyle(fontSize: 15, color: Colors.grey[600], fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ProfileCarousel(),
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
