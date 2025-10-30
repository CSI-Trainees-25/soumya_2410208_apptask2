import 'cards.dart';
import 'clipper.dart';
import 'coffee.dart';
import 'package:flutter/material.dart';
import 'cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  final List<Coffee> _coffeeMenu = [
    Coffee(
      imagepath: 'Assets/Images/image copy 2.png',
      title: 'Espresso',
      subtitle: 'with Oat Milk',
      price: '420 only',
      rating: '4.5',
    ),
    Coffee(
      imagepath: 'Assets/Images/image copy.png',
      title: 'Cappuccino',
      subtitle: 'with Milk',
      price: '450 only',
      rating: '4.8',
    ),
    Coffee(
      imagepath: 'Assets/Images/image.png',
      title: 'Latte',
      subtitle: 'with Almond Milk',
      price: '480 only',
      rating: '4.7',
    ),
    Coffee(
      imagepath: 'Assets/Images/image.png',
      title: 'Latte',
      subtitle: 'with Almond Milk',
      price: '480 only',
      rating: '4.7',
    ),
  ];
  final List<Coffee> _cart = [];
  void addToCart(Coffee coffee) {
    setState(() {
      _cart.insert(0, coffee);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${coffee.title} added to cart!'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
    //final screenHeight = MediaQuery.of(context).size.height;
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
            SizedBox(height: 20),
            _buildSearchBar(),
            SizedBox(height: 20),
            _buildCategoryBar(),
            SizedBox(height: 20),
            _buildCoffeeList(),
            SizedBox(height: 20),
            _buildSpecialCard(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF9B9B9B),
        items: [
          BottomNavigationBarItem(
            icon: IconButton(onPressed: () {}, icon: Icon(Icons.home_outlined)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(cartItems: _cart),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_bag_outlined),
            ),
            label: 'Cart',
          ),

          BottomNavigationBarItem(
            icon: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
            label: 'Profile',
          ),
        ],
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

  Widget _buildCoffeeList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.71,
      ),

      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      itemCount: _coffeeMenu.length,
      itemBuilder: (context, index) {
        final coffee = _coffeeMenu[index];

        return coffeecards(
          coffee: coffee,
          onAddToCart: () => addToCart(coffee),
        );
      },
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

  Widget _buildSpecialCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'Assets/Images/image copy 2.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Brewed Morning',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2F2D2C),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'A special blend of dark roast coffee, perfect for you.',
                  style: TextStyle(fontSize: 14, color: Color(0xFF9B9B9B)),
                ),
              ],
            ),
          ),
        ],
      ),
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
