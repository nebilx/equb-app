import 'package:equb_app/Equb/Admin/Screens/ADetails.dart';
import 'package:equb_app/Equb/Admin/Service/equbadmin.service.dart';
import 'package:equb_app/Equb/Models/UserEqub.Model.dart';
import 'package:equb_app/Equb/User/Services/equb.services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AHome extends StatefulWidget {
  const AHome({super.key});

  @override
  State<AHome> createState() => _AHomeState();
}

class _AHomeState extends State<AHome> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AdminEqubService>(context, listen: false).getEqub();
    super.initState();
  }

  Widget build(BuildContext context) {
    final prov = Provider.of<AdminEqubService>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            'EQub',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        height: MediaQuery.of(context).size.height,
        child: prov.isLoading
            ? Center(child: CircularProgressIndicator()):
            prov.isError? const Center(child: Text('Error occured'),)
            : prov.equbs.isEmpty
                ? Center(
                    child: Text('No equb'),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: prov.equbs.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 8),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 7, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 189, 189, 189),
                              borderRadius: BorderRadius.circular(20)),
                          height: MediaQuery.of(context).size.height * 0.18,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/equb_logo.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  //fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.0295),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Equb',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.002),
                                    Text(
                                      prov.equbs[index].title,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.002),
                                    Text(
                                      'Amount :- ${prov.equbs[index].amount}',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize:
                                            const Size(double.infinity, 40),
                                        backgroundColor: Colors.black,
                                        side: BorderSide.none,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                        ),
                                      ),
                                      onPressed: (() {
                                        EqubModeL equbModeL = EqubModeL(
                                          id: prov.equbs[index].id,
                                          roundMembers: prov.equbs[index].roundMembers,
                                          winners: prov.equbs[index].winners,
                                            title: prov.equbs[index].title,

                                            description:
                                                prov.equbs[index].description,
                                            members: prov.equbs[index].members,
                                            amount: prov.equbs[index].amount,
                                            memberSize:
                                                prov.equbs[index].memberSize);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ADetail(
                                                    equbModeL: equbModeL,
                                                  )),
                                        );
                                      }),
                                      child: const Text(
                                        'Details',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
      ),
    );
  }
}
