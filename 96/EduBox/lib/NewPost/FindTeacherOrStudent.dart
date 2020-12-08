import 'package:EduBox/Models/NewPostTemplate.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'NewPost.dart';

class FindTeacherOrStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var submitForm = Provider.of<SubmitForm>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Thêm yêu cầu mới'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  submitForm.reset();
                  submitForm.type = 0;
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NewPost(
                            type: 0,
                          )));
                },
                child: ClayContainer(
                  height: 60,
                  width: 300,
                  child: Center(
                      child: Text(
                    'Tìm học sinh',
                    style: TextStyle(fontSize: 30),
                  )),
                ),
              ),
              Divider(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  submitForm.reset();
                  submitForm.type = 1;
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NewPost(
                            type: 1,
                          )));
                },
                child: ClayContainer(
                  height: 60,
                  width: 300,
                  child: Center(
                      child: Text(
                    'Tìm gia sư',
                    style: TextStyle(fontSize: 30),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
