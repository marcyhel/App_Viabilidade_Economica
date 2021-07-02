import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:plan3/screens/amostragemDados/amostragemDados.dart';
import 'package:plan3/screens/coletaDados/coletaDados.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ScreenHiddenDrawer> itens = [];

  @override
  void initState() {
    itens.add(
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          colorLineSelected: Colors.amber,
          name: "Amostra",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          selectedStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
        ),
        AmostragemDados(),
      ),
    );

    itens.add(
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          colorLineSelected: Colors.amber,
          name: "name",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          selectedStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
        ),
        ColetaDados(),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Color(0xff042433).withAlpha(50),
      backgroundColorAppBar: Color(0xff042433), //Colors.blueGrey.shade700,
      screens: itens,
      //    typeOpen: TypeOpen.FROM_RIGHT,
      //    disableAppBarDefault: false,
      //    enableScaleAnimin: true,
      //    enableCornerAnimin: true,
      //    slidePercent: 80.0,
      //    verticalScalePercent: 80.0,
      isTitleCentered: true,
      contentCornerRadius: 20.0,
      //    iconMenuAppBar: Icon(Icons.menu),
      //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
      //    whithAutoTittleName: true,
      styleAutoTittleName: TextStyle(color: Colors.white),
      //    actionsAppBar: <Widget>[],
      //   backgroundColorContent: Colors.white,
      //    elevationAppBar: 4.0,
      //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
      //    enableShadowItensMenu: true,
      //    backgroundMenu: DecorationImage(image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
    );
  }
}
