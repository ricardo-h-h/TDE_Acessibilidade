import 'package:flutter/material.dart';

void main() {
  runApp(const AccessibleMusicPlayer());
}

class AccessibleMusicPlayer extends StatefulWidget {
  const AccessibleMusicPlayer({super.key});

  @override
  State<AccessibleMusicPlayer> createState() => _AccessibleMusicPlayerState();
}

class _AccessibleMusicPlayerState extends State<AccessibleMusicPlayer> {
  bool _isPlaying = false;
  bool _isLiked = false;
  double _sliderValue = 45.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF121212),
        appBar: AppBar(
          title: const Text('Player de Música Acessível'),
          backgroundColor: const Color(0xFF1DB954),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Semantics(
                label: 'Capa do álbum The Dark Side of the Moon da banda Pink Floyd', 
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: NetworkImage('https://upload.wikimedia.org/wikipedia/en/3/3b/Dark_Side_of_the_Moon.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'The Dark Side of the Moon',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'Pink Floyd',
                style: TextStyle(color: Colors.grey, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              Semantics(
                label: 'Progresso da música',
                value: '${_sliderValue.round()} por cento',
                child: Slider(
                  value: _sliderValue,
                  min: 0,
                  max: 100,
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey.shade700,
                  onChanged: (value) {
                    setState(() { _sliderValue = value; });
                  },
                ),
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    tooltip: 'Faixa anterior',
                    icon: const Icon(Icons.skip_previous, color: Colors.white, size: 36),
                    onPressed: () {},
                  ),
                  IconButton(
                    tooltip: _isPlaying ? 'Pausar' : 'Reproduzir',
                    icon: Icon(
                      _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                      color: Colors.white,
                      size: 64, 
                    ),
                    onPressed: () {
                      setState(() { _isPlaying = !_isPlaying; });
                    },
                  ),
                  IconButton(
                    tooltip: 'Próxima faixa',
                    icon: const Icon(Icons.skip_next, color: Colors.white, size: 36),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              IconButton(
                tooltip: _isLiked ? 'Descurtir' : 'Gostar',
                icon: Icon(
                  _isLiked ? Icons.favorite : Icons.favorite_border,
                  color: _isLiked ? const Color(0xFF1DB954) : Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  setState(() { _isLiked = !_isLiked; });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}