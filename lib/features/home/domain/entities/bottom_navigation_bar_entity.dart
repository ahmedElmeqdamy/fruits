class BottomNavigationBarEntity {
  BottomNavigationBarEntity({
    required this.activeImage,
    required this.inactiveImage,
    required this.name,
  });
  final String activeImage;
  final String inactiveImage;
  final String name;
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
  BottomNavigationBarEntity(
    activeImage: 'assets/images/vuesax/bold/home.svg',
    inactiveImage: 'assets/images/vuesax/outline/home.svg',
    name: 'Home',
  ),
  BottomNavigationBarEntity(
    activeImage: 'assets/images/vuesax/bold/products.svg',
    inactiveImage: 'assets/images/vuesax/outline/products.svg',
    name: 'products',
  ),
  BottomNavigationBarEntity(
    activeImage: 'assets/images/vuesax/bold/shopping-cart.svg',
    inactiveImage: 'assets/images/vuesax/outline/shopping-cart.svg',
    name: 'shop',
  ),
  BottomNavigationBarEntity(
    activeImage: 'assets/images/vuesax/bold/user.svg',
    inactiveImage: 'assets/images/vuesax/outline/user.svg',
    name: 'Account',
  ),
];
