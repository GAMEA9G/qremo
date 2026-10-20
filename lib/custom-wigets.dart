part of 'main.dart';

class ThemedBox extends StatelessWidget {
  final Widget? child;

  final double height;
  final EdgeInsetsGeometry margin;

  const ThemedBox(
      {Key? key,
      this.child,
      required this.height,
      this.margin = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Color borderColor = Theme.of(context).brightness == Brightness.dark
        ? lavenderDark
        : lavenderLight;
    Color boxColor = Theme.of(context).brightness == Brightness.dark
        ? mantleDark
        : mantleLight;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: boxColor,
          border: Border.all(color: borderColor, width: 0.5),
          borderRadius: BorderRadius.circular(15)),
      child: child,
      margin: margin,
    );
  }
}

class Card extends StatelessWidget {
  final bool isDarktheme;

  const Card({Key? key, required this.isDarktheme}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 145,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isDarktheme ? baseDark : baseLight,
          border: Border.all(
              color: isDarktheme ? mauveDark : mauveLight, width: 0.65)),
      child: Column(
        children: [
          Row(
            children: [
              Tag(isDarktheme: isDarktheme,text: "Beginner",darkThemeColor: yellowDark,lightThemeColor: yellowLight,),
              Tag(isDarktheme: isDarktheme,text: "Lv:01",darkThemeColor: greenDark,lightThemeColor: greenlight)
            ],
          )
        ],
      ),
    );
  }
}
class Tag extends StatelessWidget {
   final bool isDarktheme;
   final String text;
   final Color darkThemeColor;
   final Color lightThemeColor;

  const Tag({Key? key, required this.isDarktheme,required this.text,required this.lightThemeColor,required this.darkThemeColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                  margin: EdgeInsets.only(top: 5, left: 5),
                  padding: EdgeInsets.only(right: 5, left: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: isDarktheme ? darkThemeColor :lightThemeColor),
                  child: Text(
                    text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isDarktheme
                            ? Color.fromRGBO(0, 0, 0, 1)
                            : Color.fromRGBO(255, 255, 255, 1)),
                  ));  }
}
