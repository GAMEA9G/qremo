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

class Card extends StatefulWidget {
  final bool isDarktheme;

  const Card({Key? key, required this.isDarktheme}) : super(key: key);

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  double progress = 0.75;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 210,
        width: 160,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: widget.isDarktheme ? surface0Dark : surface0Light,
            border: Border.all(
                color: widget.isDarktheme ? surface1Dark : surface1Light,
                width: 0.65)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsetsGeometry.only(
                      left: 10, right: 10, bottom: 0, top: 10),
                  child: Text("Motion in a Straight Line",
                      style: TextStyle(
                        color: widget.isDarktheme ? textDark : textLight,
                        fontWeight: FontWeight.bold,
                      ))),
              Padding(padding: EdgeInsets.all(10),child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                    width: 75,
                    height: 75,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        M3ECircularWavyProgressIndicator(
                          value: progress,
                          color: widget.isDarktheme ? mauveDark : mauveLight,
                          backgroundColor:
                              widget.isDarktheme ? surface1Dark : surface1Light,
                          size: 65,
                          strokeWidth: 4.00,
                          trackStrokeWidth: 3.50,
                          gapSize: 4.00,
                          wavelength: 20.00,
                          waveSpeed: 10.00,
                        ),
                        Stack(children: [
                          Center(
                              child: Icon(
                            Icons.star_rounded,
                            size: 50,
                            color:
                                widget.isDarktheme ? peachDark : peachLight,
                          )),
                          Center(
                            child: Text(
                              (progress * 10).toString(),
                              style: TextStyle(
                                  color: widget.isDarktheme
                                      ? textDark
                                      : textLight),
                            ),
                          )
                        ]),
                      ],
                    )),
              )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Physics",
                    style: TextStyle(
                        color: widget.isDarktheme ? subtext0Dark : subtext0Light),
                  ))
            ]));
  }
}

class Tag extends StatelessWidget {
  final bool isDarktheme;
  final String text;
  final Color darkThemeColor;
  final Color lightThemeColor;

  const Tag(
      {Key? key,
      required this.isDarktheme,
      required this.text,
      required this.lightThemeColor,
      required this.darkThemeColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 5, left: 5),
        padding: EdgeInsets.only(right: 5, left: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isDarktheme ? darkThemeColor : lightThemeColor),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isDarktheme
                  ? Color.fromRGBO(0, 0, 0, 1)
                  : Color.fromRGBO(255, 255, 255, 1)),
        ));
  }
}

class horizontalCardList extends StatefulWidget {
  final bool isDarktheme;

  const horizontalCardList({super.key, required this.isDarktheme});

  @override
  State<horizontalCardList> createState() => _horizontalCardListState();
}

class _horizontalCardListState extends State<horizontalCardList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: subjectsList.length,
          itemBuilder: (context, i) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Practice()),
                  );
                },
                child: Card(isDarktheme: widget.isDarktheme));
          }),
    );
  }
}
