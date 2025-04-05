
part of 'main.dart';

class NoteMenu extends StatelessWidget {
  final String subjectName;
  const NoteMenu({super.key, required this.subjectName});

  @override
  Widget build(BuildContext context) {
      return Scaffold(appBar: AppBar(title: Text("${subjectName} Notes"),),
        body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: 20,itemBuilder: (context,i){

      return   GestureDetector(onTap: (){Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HtmlNote(),
                        ));  },child: ThemedBox(height: 65,margin: EdgeInsets.only(top: 10),child: Column(spacing: 10,children: [Text("Chapter Name Notes",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Padding(padding: EdgeInsets.only(left: 10),child: Text("Author:Author",)),Padding(padding: EdgeInsets.only(right: 10),child: Text("Date dd/mm/yyyy"))],),],),)
,);  },)

      ,),
      );
  }
}

