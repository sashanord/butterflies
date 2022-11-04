import 'package:butterflies/butterfly.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ButterflyList());
}


class ButterflyList extends StatefulWidget {
  const ButterflyList({Key? key}) : super(key: key);

  @override
  State<ButterflyList> createState() => _ButterflyListState();
}

class _ButterflyListState extends State<ButterflyList> {
  Butterfly? currButt = null;
  String currentDescription = '';
  final List<Butterfly> butterflies = [Butterfly('Трауриница','Русское название дано бабочке по её тёмной — «траурной» окраске. Латинский видовой эпитет antiopa связан с греческой мифологией: Антиопа — царица амазонок, взятая в плен Тесеем.'),
  Butterfly('Голубянка', 'Бабочки обычно небольшого размера, с хорошо выраженным половым диморфизмом, особенно в окраске крыльев — самцы окрашены в более яркие тона.'),
  Butterfly('Павлиний глаз ', 'Длина переднего крыла — 27—31 мм. Размах крыльев до 62 мм. Самки чаще всего несколько крупнее самца.'),
  Butterfly('Крапивница', 'Длина переднего крыла 22—24 мм[4]. Внешний край крыльев зубчатый, каждое крыло с одним резким выступом. '),
  Butterfly('name', 'description')];

  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Бабочки'),),
        body: Column(
          children: [
            TextField(controller:textEditingController,
            onSubmitted: (value) {
              textEditingController.clear();
              var contains = false;
              for(var b in butterflies){
                if (b == Butterfly(value, '')){
                  contains = true;
                  setState(() {
                    currButt = b;
                    currentDescription = b.description;
                  });
                  break;
                }
              }
              if (!contains){
                setState(() {
                  currButt = null;
                  currentDescription = 'Такой бабочки нет в списке';
                });
              }
            },),
          Expanded(
              child: ListView.separated(
            separatorBuilder: (BuildContext context, int index)=> Divider() ,
            scrollDirection: Axis.horizontal,
            itemCount: butterflies.length,
                itemBuilder:(BuildContext context, int index) =>SizedBox(width: 150,height: 10,
                    child: ListTile(
                        tileColor: (currButt == butterflies[index] ? Colors.blue: Colors.white),
                      onTap: () {
                        setState(() {
                          currButt = butterflies[index];
                          currentDescription = butterflies[index].description;
                        });
                      },
                        title: Text(butterflies[index].name,))))),
          Text(currentDescription)],
        ) ,


          //     Flexible(child: TextField()),
          // Flexible(
          //   child: ListView.builder(
          //           itemBuilder: (BuildContext context, int index) {
          //             return ListTile(
          //               tileColor: (currButt == butterflies[index] ? Colors.blue: Colors.white),
          //               title: Text(butterflies[index].name),
          //               onTap: (){
          //                 setState(() {
          //                   currButt = butterflies[index];
          //                   currentDescription = butterflies[index].description;
          //                 });
          //               },
          //             );
          //           },
          //           itemCount: butterflies.length,
          //           scrollDirection: Axis.vertical,),
          //),

          ),
        );
  }
}
