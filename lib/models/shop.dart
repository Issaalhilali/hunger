import 'package:hungerstation/models/category.dart';

class Shop {
  String id;
  String name;
  double lowerPrice;
  double delevryPrice;
  String iconURL;
  double raiting;
  String status;
  bool isAdd;
  List<Category> category;

  Shop(
      {this.id,
      this.name,
      this.lowerPrice,
      this.delevryPrice,
      this.status,
      this.isAdd,
      this.iconURL,
      this.raiting,
      this.category});
  String getCategorisNames() {
    String result = '';
    for (int i = 0; i < category.length; i++) {
      if (result == '')
        result = category[i].name;
      else
        result = result + ',' + category[i].name;
    }
    return result;
  }
}
