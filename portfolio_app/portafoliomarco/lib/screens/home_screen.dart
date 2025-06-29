import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SizedBox(height: 24),
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/5118643256761101788.jpg'),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Marco Marcano',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Prospecto a programador y editor de videos semiprofesional',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 19,
              color: Colors.blue[700],
            ),
          ),
          SizedBox(height: 32),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              padding: EdgeInsets.all(16),
              children: [
                _CircleButton(
                  icon: Icons.person,
                  label: '¿Quién soy?',
                  onTap: () => Navigator.pushNamed(context, '/about'),
                ),
                _CircleButton(
                  icon: Icons.work,
                  label: '¿Qué hago?',
                  onTap: () => Navigator.pushNamed(context, '/profile'),
                ),
                _CircleButton(
                  icon: Icons.sports_esports,
                  label: 'Hobbies',
                  onTap: () => Navigator.pushNamed(context, '/hobbies'),
                ),
                _CircleButton(
                  icon: Icons.mail,
                  label: 'Contacto',
                  onTap: () => Navigator.pushNamed(context, '/contact'),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          MusicPlayerWidget(),
          SizedBox(height: 8),
          Text(
            'Me gusta la música rock y relajante, Disfruta',
            style: TextStyle(fontSize: 15, color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class MusicPlayerWidget extends StatefulWidget {
  @override
  State<MusicPlayerWidget> createState() => _MusicPlayerWidgetState();
}

class _MusicPlayerWidgetState extends State<MusicPlayerWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<Map<String, String>> _songs = [
    {
      'title': "It's Going Down Now",
      'asset': "music/It's Going Down Now.mp3",
    },
    {
      'title': "Persona 3 ost - Blues in Velvet Room",
      'asset': "music/Persona 3 ost - Blues in Velvet Room [Extended].mp3",
    },
    {
      'title': "Resident Evil 4 Remake - The Drive",
      'asset': "music/Resident Evil 4 Remake - The Drive Extended Theme (Shooting Range Bonus Mix).mp3",
    },
    {
      'title': "Revenge",
      'asset': "music/Revenge.mp3",
    },
  ];

  int _currentSong = 0;
  bool _isPlaying = false;

  void _playPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource(_songs[_currentSong]['asset']!));
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _nextSong() async {
    await _audioPlayer.stop();
    setState(() {
      _currentSong = (_currentSong + 1) % _songs.length;
      _isPlaying = false;
    });
    _playPause();
  }

  void _prevSong() async {
    await _audioPlayer.stop();
    setState(() {
      _currentSong = (_currentSong - 1 + _songs.length) % _songs.length;
      _isPlaying = false;
    });
    _playPause();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.skip_previous, color: Colors.blue[700]),
              onPressed: _prevSong,
            ),
            Icon(Icons.music_note, color: Colors.blue[700], size: 32),
            SizedBox(width: 16),
            Flexible(
              child: Text(
                _songs[_currentSong]['title']!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 16),
            IconButton(
              icon: Icon(
                _isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.blue[700],
              ),
              onPressed: _playPause,
            ),
            IconButton(
              icon: Icon(Icons.skip_next, color: Colors.blue[700]),
              onPressed: _nextSong,
            ),
          ],
        ),
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _CircleButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(32),
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
