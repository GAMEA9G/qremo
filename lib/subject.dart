part of 'main.dart';

class SubjectMenu extends StatefulWidget {
  final String nameOfSubject;
  bool searchButton;

  SubjectMenu(
      {super.key, required this.nameOfSubject, required this.searchButton});

  @override
  _SubjectMenuState createState() => _SubjectMenuState();
}

class _SubjectMenuState extends State<SubjectMenu> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
            appBar: AppBar(
              title: Text(widget.nameOfSubject),
              actions: [
                IconButton(
                  icon: Icon(Icons.search_rounded),
                  onPressed: () {
                    setState(() {
                      widget.searchButton = !widget.searchButton;
                    });
                  },
                ),
              ],
            ),
            body: Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                    child: Column(children: [
                  widget.searchButton
                      ? TextFormField(
                          cursorColor: mauve,
                          decoration: InputDecoration(
                            labelText: 'Search ${widget.nameOfSubject}',
                            border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              borderSide:
                                  BorderSide(color: mauve, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              borderSide:
                                  BorderSide(color: mauve, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              borderSide:
                                  BorderSide(color: mauve, width: 2),
                            ),
                          )
                        )
                      :ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                alignment: Alignment.bottomCenter,
                                margin: EdgeInsets.only(top: 10),
                                width: 360,
                                height: 150,
                                decoration: BoxDecoration(
                                color: base,
                                  border:
                                      Border.all(color: teal, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Wrap(
                                  runSpacing: 5,
                                  children: [
                                    Row(
                                      children: [ 

                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 9, right: 10, top: 10),
                                              width: 124,
                                              height: 89,
                                              decoration: BoxDecoration(
                                                                                                   border: Border.all(
                                                      color: teal,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          19)),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          textAlign: TextAlign.center,
                                          "Topic Name",
                                          style: TextStyle(color: text,fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 34, left: 10),
                                          child: Text(
                                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit",style: TextStyle(color:text ,fontWeight: FontWeight.bold)),
                                        )
                                      ],
                                    )
                                  ],
                                ));
                          })
                ])))));
  }
}

