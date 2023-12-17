class Person {
  final String name;
  final String id;

  Person({required this.name, required this.id});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['user']?['name'] ?? 'Unknown', // Проверяем на null и используем значение по умолчанию, если null
      id: json['user']?['id']?.toString() ?? '',
    );
  }

  static List<Person> getUniquePeople(List<List<Person>> allPeopleInProjects) {
    // Создаем множество для отслеживания уникальных пользователей
    Set<Person> uniquePeople = Set<Person>();

    // Итерируем по списку списков пользователей в проектах
    for (var peopleInProject in allPeopleInProjects) {
      // Добавляем всех пользователей из текущего списка в множество
      uniquePeople.addAll(peopleInProject);
    }

    // Преобразуем множество обратно в список
    List<Person> result = uniquePeople.toList();

    return result;
  }

}