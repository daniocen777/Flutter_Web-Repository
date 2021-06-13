import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:verticalmenu/providers/page_provider.dart';
import 'package:verticalmenu/ui/shared/custom_menu_item.dart';

class CustomMenu extends StatefulWidget {
  CustomMenu({Key? key}) : super(key: key);

  @override
  _CustomMenuState createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  // late => variable se va a inicializar
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    this._controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (this.isOpen) {
            this._controller.forward();
          } else {
            this._controller.reverse();
          }
          setState(() {
            this.isOpen = !this.isOpen;
          });
        },
        child: Container(
          width: 150.0,
          height: this.isOpen ? 308.0 : 50.0,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          color: Colors.black,
          child: Column(
            children: [
              _Menu(isOpen: isOpen, controller: _controller),
              if (this.isOpen) ...[
                CustoMenuItem(
                    text: 'Home',
                    delay: 0,
                    onPress: () => pageProvider.goTo(0)),
                CustoMenuItem(
                    text: 'About',
                    delay: 30,
                    onPress: () => pageProvider.goTo(1)),
                CustoMenuItem(
                    text: 'Contact',
                    delay: 60,
                    onPress: () => pageProvider.goTo(2)),
                CustoMenuItem(
                    text: 'Location',
                    delay: 90,
                    onPress: () => pageProvider.goTo(3)),
                CustoMenuItem(
                    text: 'Pricing',
                    delay: 120,
                    onPress: () => pageProvider.goTo(4)),
                SizedBox(height: 8.0)
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({
    Key? key,
    required this.isOpen,
    required AnimationController controller,
  })   : _controller = controller,
        super(key: key);

  final bool isOpen;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 20),
            curve: Curves.easeInOut,
            width: this.isOpen ? 45.0 : 0.0,
          ),
          Text(
            'Menú',
            style: GoogleFonts.roboto(color: Colors.white, fontSize: 18.0),
          ),
          Spacer(),
          AnimatedIcon(
              color: Colors.white,
              icon: AnimatedIcons.close_menu,
              progress: this._controller)
        ],
      ),
    );
  }
}
