part of 'main.dart';

class Edit extends StatelessWidget {
  const Edit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Topics")),
      body: SingleChildScrollView(physics:ScrollPhysics(),child: ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: 20,itemBuilder: (context,i){
      return Padding(padding:EdgeInsets.only(top: 10,left: 10,right: 10),child:  ListTile(title: Text("Topic one",textAlign: TextAlign.center,),tileColor: Theme.of(context).brightness == Brightness.dark ? mantleDark:mantleLight,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(color: Theme.of(context).brightness == Brightness.dark ? lavenderDark : lavenderLight)),), );

      }),)
    );
  }
}
