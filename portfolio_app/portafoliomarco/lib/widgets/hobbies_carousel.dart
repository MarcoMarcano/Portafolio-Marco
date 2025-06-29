import 'package:flutter/material.dart';

class HobbiesCarousel extends StatefulWidget {
  const HobbiesCarousel({super.key});

  @override
  State<HobbiesCarousel> createState() => _HobbiesCarouselState();
}

class _HobbiesCarouselState extends State<HobbiesCarousel> {
  final Map<String, String> imagePaths = {
    'Colección de Persona': 'assets/images/5118643256761101791.jpg',
    'Colección de cartas de Pokémon': 'assets/images/5118643256761101793.jpg',
    'Parte 2 cartas Poke': 'assets/images/5118643256761101792.jpg',
    'Makoto Yuki enfrentándose a Nyx': 'assets/images/maxresdefault (1).jpg',
    'La mejor temporada de Pokémon': 'assets/images/unnamed (1).jpg',
  };

  int _currentPage = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int index) {
    if (index >= 0 && index < imagePaths.length) {
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageEntries = imagePaths.entries.toList();
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 400,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: imageEntries.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              imageEntries[index].value,
                              width: 350,
                              height: 350,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            imageEntries[index].key,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Positioned(
                  left: 0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, size: 32, color: Colors.black54),
                    onPressed: _currentPage > 0
                        ? () => _goToPage(_currentPage - 1)
                        : null,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios, size: 32, color: Colors.black54),
                    onPressed: _currentPage < imageEntries.length - 1
                        ? () => _goToPage(_currentPage + 1)
                        : null,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageEntries.asMap().entries.map((entry) {
              return Container(
                width: 10,
                height: 10,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == entry.key
                      ? Colors.blue
                      : Colors.grey[400],
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 16),
          Text(
            'Algunas fotos de mis hobbies',
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}