# flutterexamples

Examples for flutter apps.

## Snack bar
Document link : [Display a snackbar](https://flutter.dev/docs/cookbook/design/snackbars)

1.  Scaffold.of(context) method  
    "*현재 주어진 Context 에서 가장 가까운 Scaffold 를 찾아 반환해라*"

    Scaffold 외에 여러가지 Widget 에 적용 가능하다.

    + **문제점**  
    아래와 같은
    상황이면 부모의 Context 를 가지고 상위 Widget 들 중에 Scaffold 를 탐색하게 되는데 내가 원하는 Scaffold 는 아래의 _SnackBarPageState 클래스 안에 존재한다.
    ```dart
    class _SnackBarPageState extends State<SnackBarPage> {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Snack Bar Test'),
              centerTitle: true,
              backgroundColor: Colors.red,
            ),
            body: Center(
              child: FlatButton(
                child: Text('Show me',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                color: Colors.red,
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('This is SnackBar!!'),
                  ));
                },
              ),
            )
        );
      }
    }
    ```
    + **해결법**
      Scaffold 를 Builder 위젯의 build 함수에 넣어줌으로서 부모에서 받은 context 외에 Builder 위젯부터 시작하는 새로운 context childContext 를 만들어 사용할 수 있다.

      ```dart
      body: Builder(builder: (BuildContext childContext) {
          return Center(
            child: FlatButton(
              child: Text('Show me',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              color: Colors.red,
              onPressed: () {
                Scaffold.of(childContext).showSnackBar(SnackBar(
                  content: Text('This is SnackBar!!'),
                ));
              },
            ),
          );
        }));
      ```
2. 
