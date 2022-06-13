class CateTables {
  int cateID;
  String nameCateTable;
  String image;
  double price;
  int totalTable;

  CateTables(
      {required this.cateID,
      required this.nameCateTable,
      required this.image,
      required this.price,
      required this.totalTable});

  static List<CateTables> init() {
    List<CateTables> data = [
      CateTables(
          cateID: 1,
          nameCateTable: "Bread",
          image: "assets/tables/ic_black_coffee.png",
          price: 8.0,
          totalTable: 5),
      CateTables(
          cateID: 2,
          nameCateTable: "Coffee",
          image: "assets/tables/ic_black_coffee.png",
          price: 8.0,
          totalTable: 5),
      CateTables(
          cateID: 3,
          nameCateTable: "Tea",
          image: "assets/tables/ic_black_coffee.png",
          price: 8.0,
          totalTable: 5),
      CateTables(
          cateID: 4,
          nameCateTable: "Bread",
          image: "assets/tables/ic_black_coffee.png",
          price: 8.0,
          totalTable: 5)
    ];
    return data;
  }
}
