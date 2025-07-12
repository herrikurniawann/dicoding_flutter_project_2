// data.dart
import 'package:flutter/material.dart';

class Task {
  final String id;
  final String title;
  final String description;
  bool isCompleted;
  final DateTime dueDate;
  final TimeOfDay? dueTime;
  final TaskCategory category;

  Task({
    required this.id,
    required this.title,
    this.description = '',
    this.isCompleted = false,
    required this.dueDate,
    this.dueTime,
    this.category = TaskCategory.general,
  });
}

enum TaskCategory {
  work,
  personal,
  study,
  health,
  general,
}

List<Task> dummyTasks = [
  Task(
    id: 't1',
    title: 'Kuliah',
    description: 'Pastikan semua pastikan kerjakan semua tugas kuliah.',
    isCompleted: false,
    dueDate: DateTime(2025, 7, 15),
    dueTime: TimeOfDay(hour: 17, minute: 0),
    category: TaskCategory.work,
  ),
  Task(
    id: 't2',
    title: 'Belajar Dart Asynchronous',
    description: 'Pelajari Future, async-await, dan Stream.',
    isCompleted: false,
    dueDate: DateTime(2025, 7, 18),
    category: TaskCategory.study,
  ),
  Task(
    id: 't3',
    title: 'Berolahraga Pagi',
    description: 'Lari pagi 30 menit atau yoga.',
    isCompleted: true,
    dueDate: DateTime(2025, 7, 11),
    dueTime: TimeOfDay(hour: 7, minute: 0),
    category: TaskCategory.health,
  ),
  Task(
    id: 't4',
    title: 'Rapat Tim Proyek',
    description: 'Siapkan agenda rapat dan laporan progres.',
    isCompleted: false,
    dueDate: DateTime(2025, 7, 14),
    dueTime: TimeOfDay(hour: 10, minute: 30),
    category: TaskCategory.work,
  ),
  Task(
    id: 't5',
    title: 'Beli Kebutuhan Bulanan',
    description: 'Daftar belanja: beras, telur, sabun, dll.',
    isCompleted: false,
    dueDate: DateTime(2025, 7, 20),
    category: TaskCategory.personal,
  ),
  Task(
    id: 't6',
    title: 'Baca Buku "Clean Code"',
    description: 'Selesakan chapter 3 dan 4.',
    isCompleted: false,
    dueDate: DateTime(2025, 7, 25),
    category: TaskCategory.study,
  ),
];