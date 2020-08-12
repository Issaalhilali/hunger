import 'package:hungerstation/models/category.dart';
import 'package:hungerstation/models/shop.dart';

List<Shop> getshops() {
  return [
    kudo,
    betza,
    kintaky,
  ];
}

Category fastfood = new Category(
  id: '1',
  name: 'ماكولات سريعة',
);
Category etalifood = new Category(
  id: '2',
  name: 'قهوة',
);
Category sandfood = new Category(
  id: '3',
  name: 'ماكولبات امريكية',
);
Category arabicfood = new Category(
  id: '3',
  name: 'ماكولات اطاليةة',
);

Shop kudo = new Shop(
    id: '1',
    name: 'كودو',
    delevryPrice: 14,
    lowerPrice: 14,
    iconURL:
        'https://images.deliveryhero.io/image/talabat/restaurants/kudu_logo_Vertical_P_636896555774639619.jpg',
    isAdd: true,
    raiting: 4.1,
    status: null,
    category: [
      fastfood,
      etalifood,
    ]);

Shop betza = new Shop(
    id: '1',
    name: 'بيتزا',
    delevryPrice: 14,
    lowerPrice: 14,
    iconURL:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQXqod8vEzDePEqI9Dw1_hccA-6QLfxeh1cMXnLIRytymbFiqFs&usqp=CAU',
    isAdd: true,
    raiting: 6.1,
    status: null,
    category: [
      fastfood,
    ]);
Shop kintaky = new Shop(
    id: '3',
    name: 'كنتاكي',
    delevryPrice: 14,
    lowerPrice: 14,
    iconURL:
        'https://pbs.twimg.com/profile_images/1180398680039415808/DshMx_om_400x400.jpg',
    isAdd: true,
    raiting: 8.1,
    status: null,
    category: [
      fastfood,
      sandfood,
      arabicfood,
    ]);
