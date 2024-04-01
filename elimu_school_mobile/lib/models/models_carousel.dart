class DataModel {
  final String imageName;
  final String nom;
  final String prenom;

  DataModel(
    this.imageName,
    this.nom,
    this.prenom,
  );
}

List<DataModel> dataList = [
  DataModel(
    "assets/user_profile.jpeg",
    "Kouakou",
    "Cristal",
  ),
  DataModel(
    "assets/user_profile.jpeg",
    "Elijah",
    "Cristal",
  ),
  DataModel(
    "assets/user_profile.jpeg",
    "Walter",
    "Cristal",
  ),
  DataModel(
    "assets/user_profile.jpeg",
    "YOKA",
    "Cristal",
  ),
];
