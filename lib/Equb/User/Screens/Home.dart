import 'package:auto_size_text/auto_size_text.dart';
import 'package:equb_app/Equb/User/Screens/Bhome.dart';
import 'package:equb_app/Equb/User/Services/equb.services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          padding: EdgeInsets.symmetric(horizontal: 5),
          height: MediaQuery.of(context).size.height,
          child: prov.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : prov.equbs.length.isEven
                  ? Center(
                      child: Text('no Equbs'),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: prov.equbs.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 10, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 189, 189, 189),
                                borderRadius: BorderRadius.circular(25)),
                            height: MediaQuery.of(context).size.height * 0.18,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Image.network(
                                  "https://img-19.commentcamarche.net/cI8qqj-finfDcmx6jMK6Vr-krEw=/1500x/smart/b829396acc244fd484c5ddcdcb2b08f3/ccmcms-commentcamarche/20494859.jpg",
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  padding: EdgeInsets.symmetric(
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
                                    children: [
                                     const  Text(
                                        
                                       'Equb',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.005),
                                      Text(
                                        prov.equbs[index].title,
                                        style:const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.005),
                                      Text(
                                        'Amount :- ${prov.equbs[index].amount.toString()}',
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
                                        onPressed: (() {}),
                                        child: Text(
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

class test extends StatelessWidget {
  const test({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 189, 189, 189),
              borderRadius: BorderRadius.circular(25)),
          height: MediaQuery.of(context).size.height * 0.18,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Image.network(
                "https://img-19.commentcamarche.net/cI8qqj-finfDcmx6jMK6Vr-krEw=/1500x/smart/b829396acc244fd484c5ddcdcb2b08f3/ccmcms-commentcamarche/20494859.jpg",
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Catagory',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.005),
                    Text(
                      'Name',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.005),
                    Text(
                      'Amount :- 2500 Birr',
                      style: TextStyle(fontSize: 15),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 40),
                        backgroundColor: Colors.black,
                        side: BorderSide.none,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                      onPressed: (() {}),
                      child: Text(
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
      ),
    );
  }
}
