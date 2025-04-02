part of 'main.dart';

class Practice extends StatelessWidget {
  const Practice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Practice"),),
    body: Container(
     alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(left: 15, right: 15),
                               child: Column(
                children: [
                ThemedBox(
                
                height:MediaQuery.of(context).size.width /4 ,

               
                                child: Column(spacing: 10,
                children: [
                Row(children: [
                Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width /4,right: MediaQuery.of(context).size.width /4,top: 5),child: SizedBox(height: 15,child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: 5,shrinkWrap: true,itemBuilder: (BuildContext context , int index) {
                  return Icon(Icons.favorite_sharp,color: ThemeProvider().themeMode != ThemeMode.dark ? redDark:redLight,);

                }),
),
)                            
                
                ],),
                 Column(children: [Text("You Have 5 Hearts left",style: TextStyle(fontSize: 15),),
                Text("Dont make any mistakes!",style: TextStyle(fontSize: 15))
                 ]),
                  

                ],
                ),
),
            Padding(padding: EdgeInsets.all(5),child: Text(textAlign: TextAlign.center, "Question 1/15",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)
,),Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [Text("Right:x",textAlign: TextAlign.left,),Text("Wrong:x",textAlign: TextAlign.end,)],),
            SizedBox(height: 10,),
            ThemedBox(height: MediaQuery.of(context).size.width * 0.8+22,
                          child: Padding(padding: EdgeInsets.all(10),child: Column(spacing: 15, children: [Text("Question: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam a pharetra arcu. Nam placerat sit amet turpis ornare pellentesque. Integer nisl risus, efficitur accumsan turpis nec, lacinia mollis dolor")
                ,
                TextField(obscureText: true,decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(width: 2,color: Theme.of(context).brightness == Brightness.dark ? lavenderDark: lavenderLight),
                  
                ))),
               Row(spacing: 5,mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
TextButton(style:ButtonStyle(backgroundColor:MaterialStateProperty.all( Theme.of(context).brightness == Brightness.dark ? surface1Dark :surface0Light)),onPressed:(){

                } , child: Text("Skip")),
TextButton(style:ButtonStyle(backgroundColor:MaterialStateProperty.all( Theme.of(context).brightness == Brightness.dark ? surface1Dark :surface0Light)),onPressed:(){

                } , child: Text("Easy Mode")),

TextButton(style:ButtonStyle(backgroundColor:MaterialStateProperty.all( Theme.of(context).brightness == Brightness.dark ? surface1Dark :surface0Light)),onPressed:(){

                } , child: Text("Hint")),

                ],) 
,


              ]),
)            ),
       Padding(padding:EdgeInsets.only(top: 10),child: Text("4 minutes and 57 seconds left",style: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? redDark : redLight,fontSize: 20,fontWeight: FontWeight.bold),),
 )          ],
                ),

    ) 
    

    );
  }
}
