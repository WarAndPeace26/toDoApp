class Task{
  Task({
    required this.title,
    required this.isDone,
    this.from,
    this.to,
    this.description,
  });

  final String title;
  final DateTime? from;
  final DateTime? to;
  final String? description;
  final bool isDone;
}