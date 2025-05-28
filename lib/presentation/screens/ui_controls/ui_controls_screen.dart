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
    
  TransportationWay selectedTransportation = TransportationWay.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  
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
