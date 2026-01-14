import 'package:fruits/features/home/domain/entities/cart_item_entity.dart';

import 'item.dart';

class ItemList {

  ItemList({this.items});

  factory ItemList.fromEntity({required List<CartItemEntity> items}) {
    return ItemList(items: items.map((e) => ItemEntity.fromEntity(e)).toList());
  }
  List<ItemEntity>? items;

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
