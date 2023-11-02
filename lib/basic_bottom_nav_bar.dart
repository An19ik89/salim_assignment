import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:salim_assignment/chat_screen.dart';

class BasicBottomNavBar extends StatefulWidget {
  const BasicBottomNavBar({Key? key}) : super(key: key);

  @override
  _BasicBottomNavBarState createState() => _BasicBottomNavBarState();
}

class _BasicBottomNavBarState extends State<BasicBottomNavBar> {
  int _selectedIndex = 0;
  bool _hideBottomNavStatus = false;
  bool expand = false;

  static final List<Widget> _pages = <Widget>[
    const Text(""),
    const Text(""),
    const Text(""),
    const Text(""),
    const Text("")
  ];

  void _expandedContainer() {
    setState(() {
      expand = !expand;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openHideBottomNav() {
    setState(() {
      _hideBottomNavStatus = !_hideBottomNavStatus;
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0.0,
        leadingWidth: 40.0,
        leading: Image.asset("assets/images/app_bar_icon_one.png",width: 25,height: 25,),
        title: Row(
          children: [
            const Text('SeeqQul',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Color(0xff5F6368)),),
            const SizedBox(width: 15.0),
            Image.asset("assets/images/arrow.png",width: 6,height: 11,)
          ],
        ),
        actions: [
          Image.asset("assets/images/search.png",width: 18,height: 18,),
          const SizedBox(width: 30,),
          Image.asset("assets/images/group.png",width: 18,height: 18,),
          const SizedBox(width: 10,),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
             Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: double.infinity,
                    maxHeight: expand ? 350 : 150.0,
                    minHeight: 140.0
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(left: 50.0,right: 50.0),
                   // width: 300,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color.fromRGBO(76, 66, 67, 0.66)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          expand == true ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 80,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    color: Color.fromRGBO(40, 43, 43, 0.80)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: ()=>_expandedContainer(),
                                    child: Row(
                                      children: [
                                        const Text("...Less",style: TextStyle(color: Color(0xff2CCAA0)),),
                                        Image.asset("assets/images/loose.png",width: 17,height: 17,)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ) : const SizedBox.shrink(),
                          const Text(
                              "Lorem ipsum dolor sit amet consectetur. Amet aenean et nunc enim ornare vulputate. Id blandit massa id dictum pellentesque. Nulla vitae aliquam massa lectus tincidunt tortor. Quisque diam.",
                            style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.white),
                          ),
                          const SizedBox(height: 5.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("27 Oct. 2020 @5:23pm",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xffE5A5A5)),),
                              expand == false ? Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      color: Color.fromRGBO(40, 43, 43, 0.80)
                                  ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: ()=>_expandedContainer(),
                                    child: Row(
                                      children: [
                                        const Text("...More",style: TextStyle(color: Color(0xff2CCAA0)),),
                                        Image.asset("assets/images/expand.png",width: 17,height: 17,)
                                      ],
                                    ),
                                  ),
                                ),
                              ) : const SizedBox.shrink()
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
             ),
            Positioned(
                top: 30,
                left: 10,
                child: GestureDetector(
                    onTap: () {
                      openCustomPopUpMenu(context);
                      //(isMenuVisible) ? CloseCustomPopUpMenu() : OpenCustomPopUpMenu(context);
                    },
                    child: SizedBox(
                        key: _globalKey,
                        height: 27,
                        width: 25,
                        child: Image.asset("assets/images/menu.png",width: 27,height: 25,)))
                ),
            _hideBottomNavStatus == false
                ? Positioned(
                    bottom: 20,
                    right: -35,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.zero,
                          width: 30,
                          height: 30,
                          child: Image.asset("assets/images/ellipse_48.png",width: 27,height: 27,),
                        ),
                        const Gap(5),
                        Container(
                          padding: EdgeInsets.zero,
                          width: 30,
                          height: 30,
                          child: Image.asset("assets/images/group_one.png",width: 25,height: 20,),
                        ),
                        const Gap(5),
                        Container(
                          padding: EdgeInsets.zero,
                          width: 30,
                          height: 37,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: (){
                                  _settingModalBottomSheet(context);
                                },
                                  child: Image.asset("assets/images/group_two.png",width: 24,height: 21,)
                              ),
                              const Text('45k',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.white),),
                            ],
                          ),
                        ),
                        const Gap(5),
                        Container(
                          padding: EdgeInsets.zero,
                          width: 100,
                          height: 37,
                          child: Column(
                            children: [
                              Image.asset("assets/images/group_three.png",width: 24,height: 21,),
                              const Text('45k',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.white),),
                            ],
                          ),
                        ),
                        const Gap(5),
                        Container(
                          padding: EdgeInsets.zero,
                          width: 100,
                          height: 37,
                          child: Image.asset("assets/images/group_four.png",width: 24,height: 21,),
                        ),
                        const Gap(5),
                        InkWell(
                          onTap: () => _openHideBottomNav(),
                          child: Container(
                            padding: EdgeInsets.zero,
                            width: 37,
                            height: 43,
                            child: Image.asset("assets/images/slide_arrow.png",width: 37,height: 43,),
                          ),
                        ),
                      ],
                    ))
                : Positioned(
                    bottom: 20,
                    left: 0,
                    child: InkWell(
                      onTap: () => _openHideBottomNav(),
                      child: Container(
                        padding: EdgeInsets.zero,
                        width: 37,
                        height: 43,
                        child: Image.asset("assets/images/slide_arrow_one.png",width: 37,height: 43,),
                      ),
                    ),
                  ),
            Center(
              child: _pages.elementAt(_selectedIndex),
            ),

          ],
        ),
      ),
      bottomNavigationBar: _hideBottomNavStatus == false
          ? BottomNavigationBar(
              iconSize: 24,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black54,
              selectedItemColor: Colors.amberAccent,
              unselectedItemColor: Colors.white,
              selectedLabelStyle: TextStyle(color: Colors.amberAccent),
              unselectedLabelStyle: TextStyle(color: Colors.white),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  //icon: Icon(Icons.call),
                  icon: Image.asset("assets/images/bottom_one.png",width: 24,height: 24),
                  label: 'Apps',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/images/bottom_two.png",width: 24,height: 24),
                  label: 'Qucon',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/images/bottom_three.png",width: 24,height: 24),
                  label: 'Zaady',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/images/bottom_four.png",width: 24,height: 24),
                  label: 'Organize',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/images/bottom_five.png",width: 24,height: 24),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            )
          : SizedBox(height: MediaQuery.of(context).size.height * 0.05),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (ctx, _setState) {
            return Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.white,
              ),
              height: 600,
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff5F6368),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "45K Comments",
                              style: TextStyle(color: Colors.white, fontSize: 12.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 450,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return  Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: ClipRRect(
                                    child: Image.asset(
                                      'assets/images/person_one.png',
                                      width: 44,
                                      height: 44,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const Row(
                                          children: [
                                            Flexible(
                                              flex: 3,
                                              child: Text(
                                                "Kerry Jones",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Flexible(
                                              flex: 2,
                                              child: Text(
                                                "@Kerryjo",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Color(0xff5C8DFF),
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Flexible(
                                                flex: 3,
                                                child: Center(
                                                  child: Text(
                                                    "3 hours ago",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Color(0xffC4C4C4),
                                                        fontSize: 13,
                                                        fontWeight:
                                                        FontWeight.w400),
                                                  ),
                                                ))
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          "Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper amet justo quisque ullamcorper volutpat. Donec feugiat diam et tellus in habitant viverra duis.",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Color(0xff767676),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),

                                        //
                                        const SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: (){
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => const ChatScreen()),
                                                );
                                              },
                                                child: Image.asset('assets/images/comment.png',width: 16,height: 17,)
                                            ),
                                            const SizedBox(width: 10,),
                                            const Text(
                                              "15",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Color(0xffC4C4C4),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const SizedBox(width: 30,),
                                            Image.asset('assets/images/love.png',width: 16,height: 17,),
                                            const SizedBox(width: 10,),
                                            const Text(
                                              "7k",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Color(0xffC4C4C4),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const SizedBox(width: 30,),
                                            Image.asset('assets/images/flag.png',width: 16,height: 17,)
                                          ],
                                        ),
                                        const SizedBox(height: 10,),
                                        Container(
                                          width: 130,
                                          decoration: const BoxDecoration(color: Color(0xffFAFAFA),borderRadius: BorderRadius.all(Radius.circular(3))),
                                          child:  Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  "View 15 replies",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Color(0xff959595),
                                                      fontSize: 13,
                                                      fontWeight:
                                                      FontWeight.w500),
                                                ),
                                                const SizedBox(width: 15,),
                                                Image.asset('assets/images/arrow_forward.png',width: 4,height: 8,),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ))
                              ],
                            );
                          }),
                    ),
                  ),
                  Container(
                    height: 1,
                    decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 8, bottom: 24),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: 55,
                      child: Row(
                        children: [
                          ClipRRect(
                            child: Image.asset(
                              'assets/images/ellipse_149.png',
                              width: 49,
                              height: 49,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              //focusNode: focus,
                              textAlignVertical: TextAlignVertical.center,
                              controller: _controller,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: "Add a comment",
                                hintStyle: const TextStyle(
                                  color: Color(0xff5F6368),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 15,
                                ),
                                prefixIcon: FractionallySizedBox(
                                    heightFactor: .40,
                                    child: Image.asset(
                                      "assets/images/smile.png",
                                      width: 27.0,
                                      height: 27.0,
                                    )),
                                suffixIcon: FractionallySizedBox(
                                    heightFactor: .50,
                                    child: Image.asset(
                                      "assets/images/send.png",
                                      width: 24.0,
                                      height: 23.0,
                                    )),
                                border: OutlineInputBorder(
                                  borderSide: Divider.createBorderSide(
                                    context,
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: Divider.createBorderSide(
                                    context,
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: Divider.createBorderSide(
                                    context,
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;



  final GlobalKey _globalKey = GlobalKey();
  late OverlayEntry _overlayEntry;
  late Size menuSize;
  late Offset menuOffset;
  //bool isMenuVisible = false;

  void openCustomPopUpMenu(context) {
    RenderBox? renderBox =
        _globalKey.currentContext!.findRenderObject() as RenderBox?;
    menuSize = (renderBox!.size * 2);
    menuOffset = renderBox.localToGlobal(const Offset(-9, -86));
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry);
    //isMenuVisible = !isMenuVisible;
  }

  void closeCustomPopUpMenu() {
    _overlayEntry.remove();
    //isMenuVisible = !isMenuVisible;
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: menuOffset.dy + menuSize.height,
          left: menuOffset.dx,
          width: menuSize.width * 5,
          child: Material(
            color: Colors.transparent,
            child: GestureDetector(
                onTap: () {
                  closeCustomPopUpMenu();
                },
                child: const CustomPopupMenu()),
          ),
        );
      },
    );
  }
}

final Container improvisedDivider = Container(
  height: 1,
  width: 300,
  color: Colors.black,
);

class CustomPopupMenu extends StatefulWidget {
  const CustomPopupMenu({super.key});

  @override
  _CustomPopupMenuState createState() => _CustomPopupMenuState();
}

class _CustomPopupMenuState extends State<CustomPopupMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 175,
      height: 300,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Image.asset("assets/images/post_seequl.png",width: 25,height: 25,),
                const SizedBox(width: 10,),
                const Text(
                  "Post a Seequl",
                  style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w400,color: Color(0xff534D4D)),
                ),

              ],
            ),
            const Gap(13),
            Row(
              children: [
                Image.asset("assets/images/heart.png",width: 25,height: 25,),
                const SizedBox(width: 10,),
                const Text(
                  "View your likes",
                  style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w400,color: Color(0xff534D4D)),
                ),

              ],
            ),
            const Gap(13),
            Row(
              children: [
                Image.asset("assets/images/your_seequl.png",width: 25,height: 25,),
                const SizedBox(width: 10,),
                const Text(
                  "Your Seequl posts",
                  style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w400,color: Color(0xff534D4D)),
                ),

              ],
            ),
            const Gap(13),
            Row(
              children: [
                Image.asset("assets/images/reference.png",width: 25,height: 25,),
                const SizedBox(width: 10,),
                const Text(
                  "Reference contribution",
                  style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w400,color: Color(0xff534D4D)),
                ),

              ],
            ),
            const Gap(13),
            Row(
              children: [
                Image.asset("assets/images/hashtag.png",width: 25,height: 25,),
                const SizedBox(width: 10,),
                const Text(
                  "Hashtag challenges",
                  style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w400,color: Color(0xff534D4D)),
                ),

              ],
            ),
            const Gap(13),
            Row(
              children: [
                Image.asset("assets/images/notification.png",width: 25,height: 25,),
                const SizedBox(width: 10,),
                const Text(
                  "Notifications",
                  style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w400,color: Color(0xff534D4D)),
                ),

              ],
            ),
            const Gap(13),
            Row(
              children: [
                Image.asset("assets/images/about.png",width: 25,height: 25,),
                const SizedBox(width: 10,),
                const Text(
                  "About Seequl",
                  style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w400,color: Color(0xff534D4D)),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
