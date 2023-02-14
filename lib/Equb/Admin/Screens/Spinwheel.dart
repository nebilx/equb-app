import 'package:equb_app/Equb/Admin/Service/equbadmin.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class SpinWheel extends StatefulWidget {
  List<dynamic> roundMems;
  String equbId;
  int amount;
  SpinWheel({required this.roundMems, required this.equbId, required this.amount});

  @override
  State<SpinWheel> createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel> {
  final selected = BehaviorSubject<int>();
  int rewards = 0;

  List<FortuneItem> getMembers() {
    List<FortuneItem> items = [];
    widget.roundMems.forEach((element) {
      items.add(FortuneItem(child: Text(element['fullname'])));
    });

    return items;
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<AdminEqubService>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_left_outlined,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Center(
            child: Text(
              'Winner',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.black26,
          ),
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: FortuneWheel(
                    selected: selected.stream,
                    animateFirst: false,
                    items: getMembers(),
                    onAnimationEnd: () {
                      prov.declareWinner(
                          widget.equbId,
                          widget.roundMems[selected.value]["_id"],
                          context,
                          widget.amount,
                          widget.roundMems[selected.value]['fullname'],
                          widget.roundMems, );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(widget.roundMems[selected.value]
                                  ['fullname'] +
                              "has won the equb"),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected.add(Fortune.randomInt(0, getMembers().length));
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "SPIN",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
