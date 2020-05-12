import 'package:flutter/material.dart';

class MyFormValidation extends StatefulWidget {
  @override
  _MyFormValidationState createState() => _MyFormValidationState();
}

class _MyFormValidationState extends State<MyFormValidation> {
  final _formKey = GlobalKey<FormState>();

  // 포커스를 가지게 하고 싶은 대상에 적용
  FocusNode nameFocusNode;

  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // FocusNode 는 initState 에서 초기화해줘야 한다.
    nameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // FocusNode 는 dispose 해줘야 한다.
    nameFocusNode.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                // 해당 페이지에 들어오면 자동으로 포커스를 잡게된다.
                autofocus: true,

                // TextField 와 다르게 validator 를 사용할 수 있다.
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return '아무것도 입력하지 않으셨습니다.';
                  }
                },
                decoration: InputDecoration(
                    hintText: '이름을 입력해주세요',
                    border: InputBorder.none,
                    labelText: '이름'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(_formKey.currentContext)
                          .showSnackBar(SnackBar(content: Text('처리중')));
                    }
                  },
                  child: Text('완료'),
                ),
              ),
              TextField(
                controller: nameController,
                onChanged: (text) {
                  print(text);
                },
                focusNode: nameFocusNode,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: '이름을 입력해주세요',
                    border: InputBorder.none,
                    labelText: '이름'),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      FocusScope.of(context).requestFocus(nameFocusNode);
                    },
                    child: Text('포커스'),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      print(nameController.text);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(nameController.text),
                            );
                          });
                    },
                    child: Text('TextField 값 확인'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
