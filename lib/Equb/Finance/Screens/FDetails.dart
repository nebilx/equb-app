import 'package:equb_app/Equb/Finance/Models/message.models.dart';
import 'package:equb_app/Reusables/dialogs.dart';
import 'package:flutter/material.dart';

class FDetails extends StatefulWidget {
  MessageModel message;
  FDetails({required this.message});

  @override
  State<FDetails> createState() => _TFDetailsState();
}

class _TFDetailsState extends State<FDetails> {
  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
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
                                height:
                                    MediaQuery.of(context).size.width * 0.005),
                            Text(
                              widget.message.title,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.005),
                            Text(
                              'Amount :- ${widget.message.amount.toString()}',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
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
                                DecoratedDialogs.showSuccess(
                                    'Successfully Confirmed Equb',
                                    context,
                                    'okay');
                              }),
                              child: const Text(
                                'Confirm',
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
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(15)),
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Winner  ${widget.message.winner}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                Container(
                    padding:
                        const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        color: const Color.fromARGB(255, 189, 189, 189),
                        borderRadius: BorderRadius.circular(15)),
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: widget.message.participants.isEmpty
                        ? Text('No participants')
                        : ListView.builder(
                            itemCount: widget.message.participants.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  leading: Image.network(widget
                                      .message.participants[index]['image']),
                                  title: Text(widget.message.participants[index]
                                      ['fullname']),
                                  subtitle: Text(widget
                                      .message.participants[index]['phone']));
                            })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
