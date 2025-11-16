import 'package:flutter/material.dart';

class ProductsDetailsBody extends StatelessWidget {
  const ProductsDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Product Image
          Container(
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://webandcrafts.com/_next/image?url=https%3A%2F%2Fadmin.wac.co%2Fuploads%2FWhat_is_E_commerce_and_What_are_its_Applications_2_d2eb0d4402.jpg&w=4500&q=90',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Product title
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Product Name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          // Product description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SelectableText(
              'Product description goes here.',
              style: TextStyle(
                fontFamily: 'Lora',
                fontSize: 18,
                height: 1.5,
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          // Product price and rate
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  '\$99.99',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        4,
                        (index) => const Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 32,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '4.0',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Add to cart button
        ],
      ),
    );
  }
}
