class Message {
  final String nameSenter;
  final String message;
  final String avatarUrl;
  final String time;
  final bool isOnline;
  final String? imageUrl;

  Message(
      {required this.nameSenter,
      required this.message,
      required this.avatarUrl,
      required this.time,
      required this.isOnline,
      this.imageUrl});
}
