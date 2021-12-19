class Course {
  final String id;
  final String title;
  final String author;
  final String imageUrl;
  final int price;
  final int totalTime;

  Course(
      {required this.id,
      required this.title,
      required this.author,
      required this.imageUrl,
      required this.price,
      required this.totalTime});
}

List<Course> listCourse = [
  Course(
    id: '1',
    title: 'Product Design v1.0',
    author: 'Robertson Connie',
    imageUrl: 'assets/images/image01.png',
    price: 190,
    totalTime: 16,
  ),
  Course(
    id: '2',
    title: 'Java Development',
    author: 'Nguyen Shane',
    imageUrl: 'assets/images/image02.png',
    price: 190,
    totalTime: 18,
  ),
  Course(
    id: '3',
    title: 'Visual Design',
    author: 'Bert Pullman',
    imageUrl: 'assets/images/image03.png',
    price: 250,
    totalTime: 14,
  ),
  Course(
    id: '4',
    title: 'Visual Design',
    author: 'Bert Pullman',
    imageUrl: 'assets/images/image03.png',
    price: 250,
    totalTime: 14,
  )
];
