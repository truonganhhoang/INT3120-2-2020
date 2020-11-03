import 'package:flutter/material.dart';

class UserNameSetting extends StatefulWidget {
  UserNameSetting({Key key, @required this.userName}) : super(key: key);
  final String userName;
  @override
  _UserNameSettingState createState() => _UserNameSettingState();
}

class _UserNameSettingState extends State<UserNameSetting> {
  final _controller = TextEditingController();
  @override
  void initState() {
    _controller.value = TextEditingValue(text: widget.userName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.white,
      child: Material(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: size.width * 0.8,
          height: size.height * 0.22,
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    "Pick your user name!",
                    style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6)),
                  )),
              Container(
                margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                height: 40,
                child: TextField(
                  controller: _controller,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                      hintText: widget.userName,
                      contentPadding:
                          EdgeInsets.only(left: 10, top: 5, bottom: 5),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 10, right: 10),
                          // margin: EdgeInsets.only(right: 15),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Color(0xFFF2F492),
                                borderRadius: BorderRadius.circular(5)),
                            alignment: Alignment.center,
                            child: Text(
                              "Save changes",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF903939),
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
