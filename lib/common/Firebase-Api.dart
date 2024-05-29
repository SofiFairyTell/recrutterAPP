import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recrutterapp/common/Redmine-api.dart';
import 'package:recrutterapp/model/Redmine/Person.dart';

// Модель данных для Person
class PersonFirebase {
  final String name;
  final String id;
  final String roles;

  PersonFirebase({required this.name, required this.id, required this.roles});

  factory PersonFirebase.fromJson(Map<String, dynamic> json) {
    return PersonFirebase(
      name: json['name'],
      id: json['id'],
      roles: json['roles'],
    );
  }
}

// Модель данных для Skills
class Skills {
  final String name;
  final String experienceLevel;

  Skills({required this.name, required this.experienceLevel});

  factory Skills.fromJson(Map<String, dynamic> json) {
    return Skills(
      name: json['name'],
      experienceLevel: json['experienceLevel'],
    );
  }
}

// Модель данных для Recommendation
class Recommendation {
  final String date;
  final String personId;
  final int ratingValue;

  Recommendation({required this.date, required this.personId, required this.ratingValue});

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      date: json['date'],
      personId: json['personId'],
      ratingValue: json['ratingValue'],
    );
  }
}

// Класс для взаимодействия с Firebase
class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Инициализация Firebase
  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }

  // Получение списка Person
  Future<List<PersonFirebase>> fetchPersons() async {
    QuerySnapshot snapshot = await _firestore.collection('Persons').get();
    return snapshot.docs.map((doc) => PersonFirebase.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }

  // Получение списка Skills
  Future<List<Skills>> fetchSkills() async {
    QuerySnapshot snapshot = await _firestore.collection('skills').get();
    return snapshot.docs.map((doc) => Skills.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }

  // Получение списка Recommendation
  Future<List<Recommendation>> fetchRecommendations() async {
    QuerySnapshot snapshot = await _firestore.collection('recommendations').get();
    return snapshot.docs.map((doc) => Recommendation.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }

  static Future<void> uploadUsersToFirestore(List<Person> users) async {
    final firestoreInstance = FirebaseFirestore.instance;
    final batch = firestoreInstance.batch();

    // Загрузка только первых 10 пользователей
    for (var i = 0; i < users.length && i < 10; i++) {
      final user = users[i];
      final docRef = firestoreInstance.collection('Person').doc(); // Создаем новый документ
      batch.set(docRef, user.toMap());
    }

    // Выполняем батч-запрос
    await batch.commit();
  }
}