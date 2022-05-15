class CateFood {
  int cateFoodID;
  String nameCateFood;
  String image;

  CateFood({
    required this.cateFoodID,
    required this.nameCateFood,
    required this.image,
  });

  static List<CateFood> init() {
    List<CateFood> data = [
      CateFood(
        cateFoodID: 1,
        nameCateFood: "Bread",
        image: "assets/tables/ic_black_coffee.png",
      ),
      CateFood(
        cateFoodID: 2,
        nameCateFood: "Coffee",
        image: "assets/tables/ic_black_coffee.png",
      ),
      CateFood(
        cateFoodID: 3,
        nameCateFood: "Tea",
        image: "assets/tables/ic_black_coffee.png",
      ),
      CateFood(
        cateFoodID: 4,
        nameCateFood: "Bread",
        image: "assets/tables/ic_black_coffee.png",
      ),
      CateFood(
        cateFoodID: 5,
        nameCateFood: "Bread",
        image: "assets/tables/ic_black_coffee.png",
      ),
      CateFood(
        cateFoodID: 6,
        nameCateFood: "Bread",
        image: "assets/tables/ic_black_coffee.png",
      )
    ];
    return data;
  }
}
