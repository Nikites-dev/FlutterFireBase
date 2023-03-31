import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IphonePage extends StatelessWidget {
  const IphonePage({super.key});

  static const int childCount = 4;

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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    var bodyChildren = generateRows(context);
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: bodyChildren,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                  child: getNavBar(context),
                ),
              ]),
        ),
      ),
    );
  }

  Widget getIcon() {
    return Column(children: [
      IconButton(
        onPressed: () {
          print('123');
        },
        icon: Image.asset('images/pngegg.png'),
      ),
      const Text(
        'Instagram',
        style: TextStyle(color: Colors.white),
      )
    ]);
  }

  List<Widget> generateRows(BuildContext context) {
    return List.generate(childCount + 1, (index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(childCount, (index) {
              return SizedBox(
                height:
                    MediaQuery.of(context).size.width * (1 / (childCount + 1)),
                width:
                    MediaQuery.of(context).size.width * (1 / (childCount + 1)),
                child: getIcon(),
              );
            })),
      );
    });
  }
}
