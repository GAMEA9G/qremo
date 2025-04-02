import 'package:flutter/material.dart';
part of 'main.dart';


class StartPractice extends StatefulWidget {
  const StartPractice({super.key});

  @override
  State<StartPractice> createState() => _StartPracticeState();
}

class _StartPracticeState extends State<StartPractice> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chapter Name"),),
      body: Container(alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20.0),
        ),child: Column(spacing: 10,children: [
          Expanded(child: ListView(shrinkWrap: true,children: [
           Container( decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),border: Border.all(width: 3,color: ThemeProvider().themeMode == ThemeMode.dark ? lavenderDark : lavenderLight),image: DecorationImage(fit: BoxFit.fitWidth,alignment: FractionalOffset.topCenter,image:NetworkImage("https://static.pw.live/5eb393ee95fab7468a79d189/GLOBAL_CMS_BLOGS/c8a387e6-58a8-4eb2-a6f3-bd5ebbb5ded9.jpg")

            )),width: 360 ,height: 180),
            SizedBox(height: 10),
          Text("Chapter Name: Chapter_name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
            SizedBox(height: 10,),
          Text("Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam a pharetra arcu. Nam placerat sit amet turpis ornare pellentesque. Integer nisl risus, efficitur accumsan turpis nec, lacinia mollis dolor. Curabitur bibendum consectetur lectus, eget euismod nunc porta non. In luctus lectus nec sollicitudin maximus. Quisque rutrum metus dolor, ",textAlign: TextAlign.center,style: TextStyle(fontSize: 17.5
            ),),


          ],)),
                  Padding(padding: EdgeInsets.only(bottom: 10,),child: Align(alignment: Alignment.bottomCenter,child:  Row(spacing: 10,mainAxisAlignment:MainAxisAlignment.center, children: [
          FloatingActionButton(onPressed: (){
 Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Edit(
                                    
                                  )),
                        );

            },child: const Icon(Icons.edit),backgroundColor: Theme.of(context).brightness == Brightness.dark ? surface0Dark :surface0Light,foregroundColor: Theme.of(context).colorScheme.onSurface

            )
        ,FloatingActionButton.extended(onPressed: (){
          Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Practice(
                                    
                                  )),
                        );
            },label: Text("Start Practice", style: TextStyle(fontSize: 15),),backgroundColor: Theme.of(context).brightness ==Brightness.dark ? surface0Dark :surface0Light,foregroundColor: Theme.of(context).colorScheme.onSurface)


          ] ),) ,)],),
)
,);
  }
}

