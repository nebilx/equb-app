import 'package:equb_app/Authentication/Shared/Shared.dart';
import 'package:equb_app/Equb/Models/UserEqub.Model.dart';
import 'package:equb_app/Equb/User/Screens/UHome.dart';
import 'package:equb_app/Equb/User/Services/equb.services.dart';
import 'package:equb_app/Reusables/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UDetail extends StatefulWidget {
  EqubModeL equbModeL;
  UDetail({required this.equbModeL});

  @override
  State<UDetail> createState() => _UDetailState();
}

class _UDetailState extends State<UDetail> {
  @override
  // void deactivate() {
  //   Provider.of<UserEqubServices>(context, listen: false);
  //   // TODO: implement deactivate
  //   super.deactivate();
  // }

  // @override
  // void dispose() {
  //   Provider.of<UserEqubServices>(context, listen: false);
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<UserEqubServices>(context);
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
            'Details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 228, 228, 228),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 189, 189, 189),
                        borderRadius: BorderRadius.circular(15)),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/equb_logo.png",
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.3,
                          //fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          width: MediaQuery.of(context).size.width * 0.48,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 50),
                                child: Text(
                                  'Equb',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              const Divider(
                                height: 10,
                                color: Colors.white,
                                thickness: 3,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.width *
                                      0.005),
                              Text(
                                '${widget.equbModeL.title}',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.width *
                                      0.005),
                              Text(
                                'Amount :- ${widget.equbModeL.amount} Birr',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 40),
                                  backgroundColor: Colors.white,
                                  side: BorderSide.none,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                                onPressed: (() {
                                  prov.payEqub(
                                    widget.equbModeL.id!,
                                    id,
                                    context,
                                  );
                                }),
                                child: const Text(
                                  'Pay',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          'Members',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      widget.equbModeL.members!.isEmpty
                          ? const Center(
                              child: Text('No members'),
                            )
                          : Text(
                              'member size: ${widget.equbModeL.members!.length}')
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
