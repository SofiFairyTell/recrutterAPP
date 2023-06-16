import 'package:http/http.dart' as http;
import 'dart:convert';

/// Класс для взаимодействия с API HH.ru
class HeadHunterApi{
  static String baseUrl = 'https://api.hh.ru';

  Future<List<Map<String, dynamic>>> getVacancies(String text) async {
    final url = '${HeadHunterApi.baseUrl}/vacancies?text=$text';

    final res = await http.get(Uri.parse(url));

    if (res.statusCode != 200) throw Exception('Error on request');

    final data = jsonDecode(res.body) as Map<String, dynamic>;
    final items = data['items'] as List<dynamic>;

    final cardsData = <Map<String, dynamic>>[];

    items.forEach((data) {
      final link = data['alternate_url'];
      final logo = data['employer']['logo_urls']?['90'];
      final company = data['employer']['name'];
      final name = data['name'];
      final city = data['address']?['city'];

      cardsData.add({
        'link': link,
        'logo': logo,
        'company': company,
        'name': name,
        'city': city,
      });
    });

    return cardsData;
  }

  Future<List<Map<String,dynamic>>> getResume(String text) async{
    final cardsData = <Map<String, dynamic>>[];
    return cardsData;
  }
}