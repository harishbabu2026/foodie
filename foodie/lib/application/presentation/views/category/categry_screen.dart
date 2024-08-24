import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Color> col = [
    Colors.red.withOpacity(0.5),
    Colors.green.withOpacity(0.5),
    Colors.yellow.withOpacity(0.5),
    Colors.pink.withOpacity(0.5),
    Colors.grey.withOpacity(0.5),
    const Color.fromARGB(255, 17, 221, 78).withOpacity(0.5),
    const Color.fromARGB(255, 117, 9, 206).withOpacity(0.5),
    const Color.fromARGB(255, 145, 177, 6).withOpacity(0.5),
  ];

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine the number of columns based on screen width
    int crossAxisCount;
    if (screenWidth < 600) {
      // For small screens, use fewer columns
      crossAxisCount = 2;
    } else if (screenWidth < 1200) {
      // For medium screens, use more columns
      crossAxisCount = 4;
    } else {
      // For large screens, use even more columns
      crossAxisCount = 6;
    }

    // Calculate the child aspect ratio dynamically
    final childAspectRatio = (screenWidth / crossAxisCount) / 80;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 20,
            crossAxisSpacing: 30,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (context, index) {
            final colorIndex = index % col.length;
            return Container(
              decoration: BoxDecoration(
                  color: col[colorIndex],
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      "images/iwwa_swipe.png",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Item $index',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
