import 'package:flutter/material.dart';
import 'package:nazad_v_piter/models/place.dart';
import 'package:nazad_v_piter/data/places_data.dart';
import 'package:nazad_v_piter/screens/detail_screen.dart';
import 'package:nazad_v_piter/screens/category_screen.dart';
import 'package:nazad_v_piter/screens/tag_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Назад в Питер',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black87,
        elevation: 4,
      ),
      drawer: _buildDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: places.length,
          itemBuilder: (context, index) {
            final place = places[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(place: place),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.network(
                          place.imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Center(
                                child: Icon(
                                  Icons.broken_image,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          place.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Назад в Питер',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Портал-путеводитель по Санкт-Петербургу',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          
          // Раздел: История и притяжение Петербурга
          _buildCategorySection(
            context: context,
            title: 'ИСТОРИЯ И ПРИТЯЖЕНИЕ ПЕТЕРБУРГА',
            items: const [
              {'title': 'САМЫЕ ЗНАКОВЫЕ МЕСТА', 'count': 32},
              {'title': 'ЛИТЕРАТУРНЫЙ ПЕТЕРБУРГ', 'count': 61},
              {'title': 'МИСТИЧЕСКИЙ ПЕТЕРБУРГ', 'count': 37},
              {'title': 'ИСТОРИЯ БЛОКАДЫ ЛЕНИНГРАДА', 'count': 69},
            ],
          ),
          
          const Divider(),
          
          // Раздел: Архитектура и стиль Петербурга
          _buildCategorySection(
            context: context,
            title: 'АРХИТЕКТУРА И СТИЛЬ ПЕТЕРБУРГА',
            items: const [
              {'title': 'ДВОРЦЫ И ОСОБНЯКИ', 'count': 101},
              {'title': 'УНИКАЛЬНЫЕ ДОМА', 'count': 104},
              {'title': 'ИНТЕРЕСНЫЕ ДВОРИКИ', 'count': 52},
              {'title': 'ЦЕРКВИ И ХРАМЫ', 'count': 34},
            ],
          ),
          
          const Divider(),
          
          // Раздел: Культура и развлечения Петербурга
          _buildCategorySection(
            context: context,
            title: 'КУЛЬТУРА И РАЗВЛЕЧЕНИЯ ПЕТЕРБУРГА',
            items: const [
              {'title': 'АРТ И КУЛЬТУРНЫЕ ПРОСТРАНСТВА', 'count': 68},
              {'title': 'ИНТЕРЕСНЫЕ МУЗЕИ', 'count': 66},
            ],
          ),
          
          const Divider(),
          
          // Раздел: Самое интересное в Ленинградской области
          _buildCategorySection(
            context: context,
            title: 'САМОЕ ИНТЕРЕСНОЕ В ЛЕНИНГРАДСКОЙ ОБЛАСТИ',
            items: const [
              {'title': 'ИСТОРИЯ', 'count': 47},
              {'title': 'ПРИРОДА', 'count': 28},
            ],
          ),
          
          const Divider(),
          
          // Раздел: ТЕГИ
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ТЕГИ:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildTagChip(context, 'АЛЕКСАНДР I', 20),
                    _buildTagChip(context, 'АЛЕКСАНДР II', 14),
                    _buildTagChip(context, 'АЛЕКСАНДР III', 12),
                    _buildTagChip(context, 'АЛЕКСАНДР НЕВСКИЙ', 2),
                    _buildTagChip(context, 'АЛЕКСАНДРА ФЕДОРОВНА', 11),
                    _buildTagChip(context, 'АМПИР', 4),
                    _buildTagChip(context, 'АННА ИОАННОВНА', 10),
                    _buildTagChip(context, 'АРИНА РОДИОНОВНА', 2),
                    _buildTagChip(context, 'АХМАТОВА', 16),
                    _buildTagChip(context, 'БАЛАКИРЕВ', 4),
                  ],
                ),
                const SizedBox(height: 12),
                Center(
                  child: TextButton.icon(
                    onPressed: () {
                      // Здесь будет переход на экран со всеми тегами
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TagScreen(title: 'Все теги'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('ПОКАЗАТЬ ВСЕ ТЕГИ'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection({
    required BuildContext context,
    required String title,
    required List<Map<String, dynamic>> items,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
          ),
          const SizedBox(height: 4),
          ...items.map((item) => ListTile(
            title: Text(
              '${item['title']} (${item['count']})',
              style: const TextStyle(fontSize: 14),
            ),
            dense: true,
            onTap: () {
              Navigator.pop(context); // Закрываем drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryScreen(
                    categoryTitle: item['title'],
                    itemCount: item['count'],
                  ),
                ),
              );
            },
          )).toList(),
        ],
      ),
    );
  }

  Widget _buildTagChip(BuildContext context, String tag, int count) {
    return ActionChip(
      label: Text('$tag ($count)'),
      onPressed: () {
        Navigator.pop(context); // Закрываем drawer
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TagScreen(title: tag),
          ),
        );
      },
      backgroundColor: Colors.grey[200],
      labelStyle: const TextStyle(fontSize: 12),
    );
  }
}