import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controlers.')),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum TransportationWay { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {

  bool isDevelopver = false;
    /*
    Si se necesita capturar el valor se toma del valor de grupo selectedTransportation y el valor
    se queda y hay mas tiles pero se vera mas adelante,
    Al comprimirlos con el expansion tile se puede colocar que el estado por defecto puede se expanded o 
    ver que otras propiedades o comportaientos tiene.
    */
  TransportationWay selectedTransportation = TransportationWay.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  /*
  SwitchListTile(value:true,onChanged: (value){},title:const Text('Developver Mode'),
  subTilte:const Text('Controles adicionales.'));
  La ventaja de ser un SwitchListtile es que este esta dentro de una lista y podemos tener mas facilidad
  a la hora de tocarlo y no se ven mal y se puede usar.
  Se puede cambiar el valor del Switch en un StatelessWidget pero se ocuparia un gestor de estado externo,
  decir,como el Inherited Widget o soluciones propias de Flutter por eso Stateful Widget. 
  */
  @override
  Widget build(BuildContext context) {

    return ListView(physics: const ClampingScrollPhysics(), children: [
      SwitchListTile(
        title: const Text('Developver Mode.'),
        subtitle: const Text('Controles adicionales'),
        value: isDevelopver,
        onChanged: (value) => setState(() {
          isDevelopver = !isDevelopver;
        }),
      ),
      ExpansionTile(
          title: const Text('Vehiculo De Transporte :'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
                title: Text('By Car.'),
                subtitle: const Text('Viajar por carro.'),
                value: TransportationWay.car,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = TransportationWay.car;
                  });
                }),
            RadioListTile(
                title: const Text('By Boat.'),
                subtitle: const Text('Viajar por Barco.'),
                value: TransportationWay.boat,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = TransportationWay.boat;
                    })),
            RadioListTile(
                title: const Text('By Plane.'),
                subtitle: const Text('Viajar por Avion.'),
                value: TransportationWay.plane,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = TransportationWay.plane;
                    })),
            RadioListTile(
                title: const Text('By Submarine.'),
                subtitle: const Text('Viajar por submarino.'),
                value: TransportationWay.submarine,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = TransportationWay.submarine;
                    }))
          ]),
      /*
      Tambien hay checkboxes normales pero al estar en una lista se usa este y se coloca con el color
      del tema se cambia el color de los widgets con el tema especificado,se debe practicar y acostumbarse
      a tener un tema centralizado asi es mas facil cambiar los colores,formas y ayudar a que el texto
      tenga cierto formato y se vea con un estilo o forma diferente.
      */
      CheckboxListTile(
          title: const Text('¿Desayuno?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
                wantsBreakfast = !wantsBreakfast;
              })),
      CheckboxListTile(
          title: const Text('¿Almuerzo?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
                wantsLunch = !wantsLunch;
              })),
      CheckboxListTile(
          title: const Text('¿Cena?'),
          value: wantsDinner,
          onChanged: (value) {
            setState(() {
              wantsDinner = !wantsDinner;
            });
          })
    ]);
  }
}
