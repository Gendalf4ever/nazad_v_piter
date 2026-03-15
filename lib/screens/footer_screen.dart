import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12), 
      color: Colors.yellow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Nazadvpiter.ru - путеводитель по Петербургу',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Nazadvpiter.ru это путеводитель по интересным местам Петербурга',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12, 
            ),
          ),
          
          const SizedBox(height: 12), 
          
          const Text(
            'Авторские фото Петербурга',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Посмотрите подборку интересных фотографий по Петербургу',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
          
          const SizedBox(height: 12),
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Маршруты по Петербургу и контакты',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    _buildSocialButton(
                      icon: Icons.facebook,
                      label: 'Facebook',
                      url: 'https://facebook.com',
                    ),
                    _buildSocialButton(
                      icon: Icons.alternate_email,
                      label: 'Twitter',
                      url: 'https://twitter.com',
                    ),
                    _buildSocialButton(
                      icon: Icons.play_circle_filled,
                      label: 'Youtube',
                      url: 'https://youtube.com',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'О проекте и его авторе',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    _buildFooterLink(
                      label: 'Продажа уникальной квартиры на наб Кутузова',
                    ),
                    _buildFooterLink(
                      label: 'Карта сайта',
                    ),
                    _buildFooterLink(
                      label: 'Продажа видовой квартиры на наб. Грибоедова',
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Старинные карты Петербурга',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    _buildFooterLink(
                      label: 'Продажа 2-этажн. квартиры на ул. Чайковского',
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Копирайт
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 8),
            child: const Text(
              '© 2024 Назад в Питер',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required String url,
  }) {
    return InkWell(
      onTap: () => _launchUrl(url),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          children: [
            Icon(icon, color: Colors.amber, size: 16), 
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12, 
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterLink({required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12, 
        ),
      ),
    );
  }
}