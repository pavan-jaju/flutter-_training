class Product {
  int id;
  String name;
  String? description;
  String category;
  String imageUrl;
  double rate;

  Product(
      {required this.id,
      required this.name,
      required this.category,
      this.description,
      required this.imageUrl,
      required this.rate});

  static List<Product> GetProducts() {
    return List.generate(
        50,
        (index) => Product(
            id: index,
            name: 'Item $index',
            category: 'Category $index',
            imageUrl:
                'https://cdn.shopify.com/s/files/1/0533/2089/files/placeholder-images-product-6_large.png?format=jpg&quality=90&v=1530129477',
            rate: 5,
            description: index % 2 == 0
                ? null
                : 'This is the description of item $index'));
  }
}
