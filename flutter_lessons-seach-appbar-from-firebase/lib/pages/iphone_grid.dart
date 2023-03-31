import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IphoneGridPage extends StatelessWidget {
  const IphoneGridPage({super.key});

  static const int gridWidth = 4;
  static const int gridHeight = 5;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: GridView.count(
                    crossAxisCount: gridWidth,
                    children: List.generate(gridHeight * gridWidth, (index) {
                      return getIcon(context);
                    }),
                  ),
                ),
                getNavBar(context),
              ]),
        ),
      ),
    );
  }

  Widget getIcon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        IconButton(
          onPressed: () {
            print('123');
            print(MediaQuery.of(context).size);
          },
          icon: Image.asset('images/pngegg.png'),
        ),
        const Text(
          'Instagram',
          style: TextStyle(color: Colors.white),
        )
      ]),
    );
  }

  Widget getNavbarButton(BuildContext context,
      {Icon icon = const Icon(Icons.abc)}) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.13,
        height: MediaQuery.of(context).size.width * 0.13,
        child: ElevatedButton(
          onPressed: () {},
          child: icon,
        ));
  }

  Widget getNavBar(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(255, 255, 255, 0.2),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            getNavbarButton(context, icon: const Icon(Icons.ac_unit)),
            getNavbarButton(context,
                icon: const Icon(Icons.temple_hindu_sharp)),
            getNavbarButton(context, icon: const Icon(Icons.dangerous)),
            getNavbarButton(context,
                icon: const Icon(Icons.zoom_out_map_sharp)),
          ],
        ),
      ),
    );
  }
}
