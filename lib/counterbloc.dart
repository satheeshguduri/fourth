import 'dart:async';



enum CounterAction{
INCREMENT,DECREMENT,RESET
}

class CounterBloc{
  int counter;
  final _streamContoller = StreamController<int>();

  StreamSink<int> get counterSink => _streamContoller.sink;
  Stream<int> get counterStream => _streamContoller.stream;


  final _eventContoller = StreamController<String>();

  StreamSink<String> get eventSink => _eventContoller.sink;
  Stream<String> get eventStream => _eventContoller.stream;


  CounterBloc() {
    counter = 0;
    eventStream.listen((event) {
      if(event == "increment") counter++;
    //  else if(event == CounterAction.DECREMENT) counter--;
    //  else if(event == CounterAction.RESET) counter=0;

      counterSink.add(counter);
    });
  }


}