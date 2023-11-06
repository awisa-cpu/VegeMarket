import 'package:flutter/material.dart';
import 'package:shopcart/Views/app_views/account.dart';
import 'package:shopcart/Views/app_views/product_category.dart';
import 'package:shopcart/Views/app_views/favourite.dart';
import 'package:shopcart/Views/product_views/home_product.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Widget build(BuildContext context) {
    //
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            await _navigatorKeys[_currentIndex].currentState!.maybePop();

        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        //
        body: Stack(
          children: [
            _buildOffStateNavigator(0),
            _buildOffStateNavigator(1),
            _buildOffStateNavigator(2),
            _buildOffStateNavigator(3)
          ],
        ),

        //
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: _selectTab,
          enableFeedback: false,

          //
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: "Category",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
              ),
              label: "Favourite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "Account",
            )
          ],
        ),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilder({
    required BuildContext context,
    required int index,
  }) {
    return {
      '/': (context) {
        return const [
          HomeProduct(),
          ProductCategory(),
          FavouritePage(),
          ProfilePage(),
        ].elementAt(index);
      }
    };
  }

  Widget _buildOffStateNavigator(int index) {
    var routeBuilders = _routeBuilder(context: context, index: index);

    return Offstage(
      offstage: _currentIndex != index,
      child: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) {
              return routeBuilders[settings.name]?.call(context) ??
                  const Center(
                    child: Text('route error'),
                  );
            },
          );
        },
      ),
    );
  }
}
