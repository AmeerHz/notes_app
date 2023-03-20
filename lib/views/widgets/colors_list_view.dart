import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});
  final bool isSelected;
  final Color color ;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ?  CircleAvatar(
            backgroundColor: Colors.white,
            radius: 38,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 33,
            ),
          )
        :  CircleAvatar(
            backgroundColor:color,
            radius: 38,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

int currentIndex = 0;
List<Color> colors = const [
  Color(0xff233d4d),
  Color(0xfffe7f2d),
  Color(0xfffcca46),
  Color(0xffa1c181),
  Color(0xff619b8a),
];

class _ColorsListViewState extends State<ColorsListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  setState(() {});
                },
                child: ColorItem(
                  color: colors[index],
                  isSelected: currentIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
