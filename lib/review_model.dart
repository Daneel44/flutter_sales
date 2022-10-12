class Review {
  int id;
  String profilePicture;
  int note;
  String avis;

  Review(this.id, this.profilePicture, this.note, this.avis);
}

final List<Review> reviewList = [
  Review(1, 'https://picsum.photos/80/80', 3, 'Le premier avis posté !'),
  Review(2, 'https://picsum.photos/80/80', 4, 'Super occaz!'),
  Review(3, 'https://picsum.photos/80/80', 0, 'Avis fictif'),
];
