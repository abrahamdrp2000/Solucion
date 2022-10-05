import 'package:flutter/material.dart';
import  'package:device_info_x/device_info_x.dart';
import 'package:flutter/scheduler.dart';
import 'main.dart';


class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Informacion del Equipo'),
        ),
        body:  Center(
          child: InfoTabView(),
        ),
      );
  }
}
class InfoTabView extends StatefulWidget {
  const InfoTabView({Key? key}) : super(key: key);

  @override
  State<InfoTabView> createState() => _InfoTabViewState();
}

class _InfoTabViewState extends State<InfoTabView> {
  Map map = {};
  Map map2 = {};
  Map map3 = {};

  Future<void> getBatteryInfo() async {
    final result = await DeviceInfoX().getBattery();
    if (result != null) {
      map = result.toMap();
    }
    if (mounted && map.isNotEmpty) {
      setState(() {});
    }
  }

  Future<void> getMemoryInfo() async {
    final result = await DeviceInfoX().getMemoryInfo();
    if (result != null) {
      map2 = result.toMap();
    }
    if (mounted && map.isNotEmpty) {
      setState(() {});
    }
  }

  Future<void> getNetworkInfo() async {
    final result = await DeviceInfoX().getNetworkInfo();
    if (result != null) {
      map3 = result.toMap();
    }
    if (mounted && map.isNotEmpty) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await getBatteryInfo();
      await getMemoryInfo();
      await getNetworkInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Text(
         'Level Bateria:',
         style: TextStyle(
           fontStyle: FontStyle.italic,
           fontSize: 25,
             ),
           ),
        Image.asset('assets/2.jpg', scale: 7,),
        Text(
            map['level'].toString() + '\%\n',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 25,
          ),
        ),
        Text(
            map2['ram']['name'].toString() + ':',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 25,
          ),
        ),
        Image.asset('assets/1.jpg', scale: 5,),
        Text(
            'Free: ' + map2['ram']['free'].toString()+', Used: ' + map2['ram']['used'].toString()+'\n',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 25,
          ),
        ),
        Image.asset('assets/2.png',  scale: 10,),
        Text(
            'Network-WIFI: '+ map3['wifi']['state'].toString(),
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 25,
          ),
        ),

      ],
    );
  }
}


