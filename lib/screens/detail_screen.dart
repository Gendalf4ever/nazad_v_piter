import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:nazad_v_piter/models/place.dart';
import 'package:nazad_v_piter/data/place_details.dart';

class DetailScreen extends StatelessWidget {
  final Place place;

  const DetailScreen({super.key, required this.place});

  Future<void> _launchMapUrl() async {
    final Uri url = Uri.parse(place.mapLink);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          place.title,
          style: const TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Большое изображение
            Image.network(
              place.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 80, color: Colors.grey),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Название
                  Text(
                    place.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Подробное описание с жирным текстом
                  _buildRichText(placeDetails[place.id] ?? 'Описание скоро появится...'),
                  const SizedBox(height: 24),
                  // Кнопка "Открыть на карте"
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: _launchMapUrl,
                      icon: const Icon(Icons.map),
                      label: const Text('Открыть на карте'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black87,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRichText(String text) {
    final RegExp regex = RegExp(r'\*\*\*(.*?)\*\*\*');
    final List<TextSpan> spans = [];
    int currentIndex = 0;
    final matches = regex.allMatches(text).toList();

    for (final match in matches) {
      if (match.start > currentIndex) {
        spans.add(
          TextSpan(
            text: text.substring(currentIndex, match.start),
            style: const TextStyle(fontSize: 16, height: 1.5),
          ),
        );
      }

      //жирный текст 
      spans.add(
        TextSpan(
          text: match.group(1), // Текст внутри *** ***
          style: const TextStyle(
            fontSize: 16,
            height: 1.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

      currentIndex = match.end;
    }

    if (currentIndex < text.length) {
      spans.add(
        TextSpan(
          text: text.substring(currentIndex),
          style: const TextStyle(fontSize: 16, height: 1.5),
        ),
      );
    }

    return RichText(
      text: TextSpan(
        children: spans,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}