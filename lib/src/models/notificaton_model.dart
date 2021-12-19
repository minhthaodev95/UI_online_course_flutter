enum notiType { payment, normal }

class Notification {
  final String title;
  final notiType type;
  final String time;

  Notification({required this.title, required this.type, required this.time});
}
