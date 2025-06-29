import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  bool _showTransformation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              _showTransformation
                  ? 'Era Bait'
                  : 'Desarrollado por Marco Marcano (Marcoxz02)',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            if (!_showTransformation) ...[
              Text(
                'Email: marcoxz02@gmail.com.com',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                'GitHub: github.com/marcoxz02',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Center(
                child: Image.asset(
                  'assets/images/Diseño sin título.png',
                  width: 180,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showTransformation = true;
                  });
                },
                child: Text(
                  'Presiona aquí para Bombardear la Unimar',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 24),
            ] else ...[
              SizedBox(height: 40),
              Center(
                child: Image.asset(
                  'assets/images/GP-D2w2W4AAud8F.jpg',
                  width: 250,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 40),
            ],
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
