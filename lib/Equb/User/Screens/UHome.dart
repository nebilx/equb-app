import 'package:auto_size_text/auto_size_text.dart';
import 'package:equb_app/Equb/User/Screens/UDetail.dart';
import 'package:equb_app/Equb/User/Services/equb.services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UHome extends StatefulWidget {
  const UHome({super.key});

  @override
  State<UHome> createState() => _UHomeState();
}

class _UHomeState extends State<UHome> {
  @override
  void initState() {
    Provider.of<UserEqubServices>(context, listen: false).getEqubs();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // tuz buz obiyanzaw
    final prov = Provider.of<UserEqubServices>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : prov.equbs.isEmpty
                  ? const Center(
                      child: Text('no Equbs'),
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
                            padding:
                               const EdgeInsets.only(left: 7, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color:const Color.fromARGB(255, 189, 189, 189),
                                borderRadius: BorderRadius.circular(20)),
                            height: MediaQuery.of(context).size.height * 0.18,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'image/equb_logo.png',
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children:[
                                    const  Text(
                                        'Equb',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.002),
                                      Text(
                                        prov.equbs[index].title,
                                        style:const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.002),
                                      Text(
                                        'Amount :- ${prov.equbs[index].amount.toString()}',
                                        style: const TextStyle(fontSize: 15),
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
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const UDetail()),
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
      ),
    );
  }
}
