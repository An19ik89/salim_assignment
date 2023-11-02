import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter/foundation.dart' as foundation;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;

  _onBackspacePressed() {
    _controller
      ..text = _controller.text.characters.toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          const Gap(10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                InkWell(
                  onTap: ()=>Navigator.of(context).pop(),
                  child: Image.asset(
                    'assets/images/reply_back.png',
                    width: 25,
                    height: 25,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Reply",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color(0xff4B4B4B),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const Gap(44),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        'assets/images/person_one.png',
                        width: 44,
                        height: 44,
                      ),
                    ),
                    Container(
                      width: 1,
                      color: const Color(0xff886826),
                      height: 100,
                    ),
                    ClipRRect(
                      child: Image.asset(
                        'assets/images/ellipse_149.png',
                        width: 44,
                        height: 44,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                        fontWeight: FontWeight.w400),
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
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          //overflow: TextOverflow.clip,
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.rtl,
                          softWrap: true,
                          text: const TextSpan(
                            text: 'Replying to ',
                            style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w500),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'johndoe@johndoe',
                                  style:
                                      TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xffffbb00))),
                            ],
                          ),
                        ),
                        const Gap(18),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 66,
                                child: TextField(
                                  //focusNode: focus,
                                  textAlignVertical: TextAlignVertical.center,
                                  controller: _controller,
                                  cursorColor: Colors.black,
                                  style: const TextStyle(color: Colors.black),
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
                                        child: InkWell(
                                          child: Image.asset(
                                            "assets/images/smile.png",
                                            width: 27.0,
                                            height: 27.0,
                                          ),
                                          onTap: (){
                                            setState(() {
                                              emojiShowing = !emojiShowing;
                                            });
                                          },
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
                                ),
                              ),
                              Offstage(
                                offstage: !emojiShowing,
                                child: SizedBox(
                                    height: 250,
                                    child: EmojiPicker(
                                      textEditingController: _controller,
                                      onBackspacePressed: _onBackspacePressed,
                                      config: Config(
                                        columns: 7,
                                        // Issue: https://github.com/flutter/flutter/issues/28894
                                        emojiSizeMax: 32 *
                                            (foundation.defaultTargetPlatform ==
                                                TargetPlatform.iOS
                                                ? 1.30
                                                : 1.0),
                                        verticalSpacing: 0,
                                        horizontalSpacing: 0,
                                        gridPadding: EdgeInsets.zero,
                                        initCategory: Category.RECENT,
                                        bgColor: const Color(0xFFF2F2F2),
                                        indicatorColor: Colors.blue,
                                        iconColor: Colors.grey,
                                        iconColorSelected: Colors.blue,
                                        backspaceColor: Colors.blue,
                                        skinToneDialogBgColor: Colors.white,
                                        skinToneIndicatorColor: Colors.grey,
                                        enableSkinTones: true,
                                        recentTabBehavior: RecentTabBehavior.RECENT,
                                        recentsLimit: 28,
                                        replaceEmojiOnLimitExceed: false,
                                        noRecents: const Text(
                                          'No Recents',
                                          style: TextStyle(fontSize: 20, color: Colors.black26),
                                          textAlign: TextAlign.center,
                                        ),
                                        loadingIndicator: const SizedBox.shrink(),
                                        tabIndicatorAnimDuration: kTabScrollDuration,
                                        categoryIcons: const CategoryIcons(),
                                        buttonMode: ButtonMode.MATERIAL,
                                        checkPlatformCompatibility: true,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
