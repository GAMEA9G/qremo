
part of 'main.dart';

class NoteMenu extends StatelessWidget {
  const NoteMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Subject Name Notes"),),
        body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: 20,itemBuilder: (context,i){

      return ThemedBox(height: 50,margin: EdgeInsets.only(top: 10),child: Column(spacing: 10,children: [Text("Subject Name Notes",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse quis gravida nisl. Fusce arcu magna, convallis vitae tellus eget, faucibus pulvinar ipsum. Maecenas ut nisl eget mauris laoreet bibendum"),],),);
    },)

      ,),
      );
  }
}

