import 'package:equb_app/Equb/Finance/Models/message.models.dart';
import 'package:equb_app/Equb/Finance/Screens/FDetails.dart';
import 'package:equb_app/Equb/Finance/Services/message.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FHome extends StatefulWidget {
  const FHome({super.key});

  @override
  State<FHome> createState() => _FHomeState();
}

class _FHomeState extends State<FHome> {
  @override
  void initState() {
    Provider.of<MessageService>(context, listen: false).getMessages(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MessageService>(context);
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
      body: prov.isLoaidng
          ? const Center(child: CircularProgressIndicator())
          : prov.isError
              ? const Center(
                  child: Text('Error occured'),
                )
              : prov.messages.isEmpty
                  ? const Center(
                      child: Text('No messages yet'),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          itemCount: prov.messages.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 189, 189, 189),
                                    borderRadius: BorderRadius.circular(20)),
                                height:
                                    MediaQuery.of(context).size.height * 0.18,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          prov.messages[index].title,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(2),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.18,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                            prov.messages[index].amount
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                          onPressed: () {
                                            MessageModel messageModel =
                                                MessageModel(
                                                    title: prov
                                                        .messages[index].title,
                                                    description: prov
                                                        .messages[index]
                                                        .description,
                                                    winner: prov
                                                        .messages[index].winner,
                                                    amount: prov
                                                        .messages[index].amount,
                                                    date: prov
                                                        .messages[index].date,
                                                    participants: prov
                                                        .messages[index]
                                                        .participants);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FDetails(
                                                        message: messageModel,
                                                      )),
                                            );
                                          },
                                          icon: Icon(Icons.arrow_forward_ios)),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })),
                    ),
    );
  }
}
