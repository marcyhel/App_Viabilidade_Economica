import 'package:flutter/material.dart';
import 'package:parallax_image/parallax_image.dart';
import 'package:plan3/screens/componentes/fade.dart';
import 'package:plan3/screens/sobre/componente/paragrafo.dart';

import 'componente/imag.dart';
import 'componente/paralax.dart';

class SobreNos extends StatefulWidget {
  SobreNos({Key? key}) : super(key: key);

  @override
  State<SobreNos> createState() => _SobreNosState();
}

class _SobreNosState extends State<SobreNos> {
  bool _visible = false;
  bool _visible1 = false;
  bool _visible2 = false;
  int daley = 400;
  int velo = 500;
  var top = -30.0;
  var top2 = -30.0;
  var top3 = -30.0;
  double actualHeight = 0;
  void fadess() async {
    await Future.delayed(Duration(milliseconds: 300));
    setState(() {
      _visible = !_visible;
    });
    await Future.delayed(Duration(milliseconds: 300));
    setState(() {
      _visible1 = !_visible1;
    });
    await Future.delayed(Duration(milliseconds: 300));
    setState(() {
      _visible2 = !_visible2;
    });
  }

  @override
  void initState() {
    fadess();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = new ScrollController();
    return Scaffold(
      // backgroundColor: Color(0xff042433),
      body: ListView(controller: controller, children: [
        Fade(
          delay: 200,
          mili: 500,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                //color: Colors.white,
                ),
            child: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                  child: Text(
                    " O software permite ao produtor fazer uma avaliação econômica de um projeto de aquaponia, especificamente na produção de hortaliças e peixes. O aplicativo comunica a viabilidade econômica do projeto em relação ao i) valor/riqueza que o projeto gera; ii) à taxa de retorno obtida no investimento, e; iii) o prazo de recuperação do capital investido. \nEspecificamente, o software permitirá ao produtor:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Paragrafo(),
                Imag(img: "image/party.jpeg"),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
