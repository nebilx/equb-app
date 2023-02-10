import 'package:equb_app/Equb/Admin/Screens/Spinwheel.dart';
import 'package:equb_app/Equb/Models/UserEqub.Model.dart';
import 'package:flutter/material.dart';

class ADetail extends StatefulWidget {
  EqubModeL equbModeL;
  ADetail({required this.equbModeL});

  @override
  State<ADetail> createState() => _ADetailState();
}

class _ADetailState extends State<ADetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_left_outlined,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
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
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 228, 228, 228),
            ),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 189, 189, 189),
                        borderRadius: BorderRadius.circular(15)),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Image.network(
                          "https://img-19.commentcamarche.net/cI8qqj-finfDcmx6jMK6Vr-krEw=/1500x/smart/b829396acc244fd484c5ddcdcb2b08f3/ccmcms-commentcamarche/20494859.jpg",
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.3,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 5),
                        Container(
                          padding: EdgeInsets.symmetric(
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
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: const Text(
                                  'Equb',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Divider(
                                height: 10,
                                color: Colors.white,
                                thickness: 3,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.width *
                                      0.005),
                              Text(
                                widget.equbModeL.title,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.width *
                                      0.005),
                              Text(
                                'Amount :-  ${widget.equbModeL.amount} ',
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SpinWheel()),
                                  );
                                }),
                                child: Text(
                                  'Draw',
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
                  
                          widget.equbModeL.members!.isEmpty
                      ? Center(
                          child: Text('No members'),
                        )
                      : Text('data...')
                  
                ],
              ),
            )),
      ),
    );
  }
}
