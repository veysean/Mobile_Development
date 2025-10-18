class CustomDuration {
  final int _durationInMS;

  // Ensure that the input of duration is greater than 0
  const CustomDuration._(this._durationInMS)
    : assert(_durationInMS >= 0, 'Duration must be non-negative');

  CustomDuration.fromHours(int hours) : _durationInMS = hours * 3600000;
  CustomDuration.fromMinutes(int minutes) : _durationInMS = minutes * 60000;
  CustomDuration.fromSeconds(int seconds) : _durationInMS = seconds * 1000;

  // Getter
  int get inMilliseconds => _durationInMS;

  bool operator >(CustomDuration other) {
    return _durationInMS > other._durationInMS;
  }

  CustomDuration operator +(CustomDuration other) {
    return CustomDuration._(_durationInMS + other._durationInMS);
  }

  CustomDuration operator -(CustomDuration other) {
    int result = _durationInMS - other._durationInMS;
    if (result < 0) {
      throw Exception("Result is negative!");
    }
    return CustomDuration._(result);
  }

  @override
  String toString() {
    return 'CustomDuration: $_durationInMS ms';
  }
}

void main() {
  //Case 1 all operation are good
  var d1 = CustomDuration.fromMinutes(5);
  var d2 = CustomDuration.fromSeconds(120);

  print(d1); 
  print(d2); 

  print(d1 > d2); 
  print(d1 + d2);
  print(d1 - d2); 

  //Case 2 the minus operation is impossible
  var d3 = CustomDuration.fromMinutes(20);
  var d4 = CustomDuration.fromHours(1);

  print(d3 > d4);
  print(d3 + d4);
  print(d3 - d4);
}
