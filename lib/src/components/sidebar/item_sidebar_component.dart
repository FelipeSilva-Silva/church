import 'package:flutter/material.dart';

class ItemSidebarComponent extends StatefulWidget {
  const ItemSidebarComponent({
    super.key,
    required this.icon,
    required this.text,
    required this.isExpanded,
    required this.selectedPage,
    required this.index,
    required this.indexSelected,
  });

  final IconData icon;
  final String text;
  final bool isExpanded;
  final Function selectedPage;
  final int indexSelected;
  final int index;

  @override
  State<ItemSidebarComponent> createState() => _ItemSidebarComponentState();
}

class _ItemSidebarComponentState extends State<ItemSidebarComponent> {
  bool hover = false;
  late bool isSelected;

  @override
  Widget build(BuildContext context) {
    setState(() {
      isSelected = (widget.index == widget.indexSelected) ? true : false;
    });
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: InkWell(
        onTap: () {
          widget.selectedPage(widget.index);
        },
        onHover: (value) => setState(() {
          hover = value;
        }),
        child: Ink(
          child: SizedBox(
            width: 200,
            height: 50,
            child: Center(
              child: Row(
                mainAxisAlignment: widget.isExpanded
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: hover
                          ? Colors.white
                          : isSelected
                              ? Colors.white
                              : Colors.blue[800],
                    ),
                    child: Icon(widget.icon,
                        color: hover
                            ? Colors.black
                            : isSelected
                                ? Colors.black
                                : Colors.white),
                  ),
                  const SizedBox(width: 5),
                  widget.isExpanded
                      ? Text(
                          widget.text,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: hover
                                  ? Colors.white
                                  : isSelected
                                      ? Colors.white
                                      : Colors.grey),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
