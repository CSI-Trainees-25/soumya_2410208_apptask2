import 'cards.dart';
import 'clipper.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('Assets/Images/Mask group.png'),
              ),
            ),
          ),
        ],
        leading: Icon(Icons.grid_view_rounded, color: Colors.brown, size: 28),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              width: 200,

              child: Text(
                'Find the best',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ),
            Container(
              child: Text(
                textAlign: TextAlign.right,
                '    Coffee to your taste',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            _buildSearchBar(),
            SizedBox(height: screenHeight * 0.02),
            _buildCategoryBar(),
            SizedBox(height: screenHeight * 0.02),
            _buildCoffeeList(screenHeight),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Find your coffee...',
              hintStyle: const TextStyle(color: Color(0xFF9B9B9B)),
              prefixIcon: const Icon(Icons.search, color: Color(0xFF9B9B9B)),
              filled: true,
              fillColor: const Color(0xFFF3F3F3),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 18),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 176, 133, 118),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipPath(clipper: SearchClipper()),
        ),
      ],
    );
  }

  Widget _buildCoffeeList(double screenHeight) {
    return SizedBox(
      height: screenHeight * 0.38,
      child: ListView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        children: [
          coffeecards(
            imagepath: 'Assets/Images/image copy 2.png',
            title: 'Espresso',
            Subtitle: 'with Oat Milk',
            price: '4.20',
            Rating: '4.5',
          ),
          SizedBox(width: 20),
          coffeecards(
            imagepath: 'Assets/Images/image copy.png',
            title: 'Cappuccino',
            Subtitle: 'with Milk',
            price: '4.50',
            Rating: '4.8',
          ),
          SizedBox(width: 20),
          coffeecards(
            imagepath: 'Assets/Images/image.png',
            title: 'Latte',
            Subtitle: 'with Almond Milk',
            price: '4.80',
            Rating: '4.7',
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryBar() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      labelColor: const Color(0xFFC67C4E),
      unselectedLabelColor: const Color(0xFF9B9B9B),
      labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      unselectedLabelStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      indicator: const CircleTabIndicator(color: Color(0xFFC67C4E), radius: 4),
      indicatorPadding: const EdgeInsets.only(top: 10),
      tabs: const [
        Tab(text: 'Espresso'),
        Tab(text: 'Latte'),
        Tab(text: 'Cappuccino'),
        Tab(text: 'Cafetière'),
      ],

      dividerColor: Colors.transparent,
      tabAlignment: TabAlignment.start,
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()..color = color;
    final Offset circleOffset = Offset(
      configuration.size!.width / 2,
      configuration.size!.height - radius,
    );
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
