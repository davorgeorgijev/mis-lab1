import 'package:flutter/material.dart';

void main() {
  runApp(const SportsClothingApp());
}

class SportsClothingApp extends StatelessWidget {
  const SportsClothingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sports Clothing App',
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'name': 'Running Shoes',
      'image':
      'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1720814134-adidas-adizero-pro1612-66918a0e69369.jpg?crop=1xw:1xh;center,top&resize=980:*',
      'description': 'Lightweight and comfortable running shoes.',
      'price': '\$120'
    },
    {
      'name': 'Sports T-Shirt',
      'image': 'https://m.media-amazon.com/images/I/51Fk5E4852L._AC_UY1100_.jpg',
      'description': 'Breathable and stylish sports t-shirt.',
      'price': '\$70'
    },
    {
      'name': 'Sports Pants',
      'image':
      'https://m.media-amazon.com/images/I/615zInSN5bL._AC_UF1000,1000_QL80_.jpg',
      'description': 'Flexible and durable sports pants.',
      'price': '\$50'
    },
  ];

  ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('213266'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailScreen(product: product),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      product['image']!,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product['name']!,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      product['price']!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Map<String, String> product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product['image']!,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product['name']!,
              style:
              const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              product['description']!,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Text(
              product['price']!,
              style:
              const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
