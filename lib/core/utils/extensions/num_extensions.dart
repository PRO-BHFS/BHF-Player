import 'dart:typed_data';
extension Numberes on num {
  String range(num min, num max) {
    final newValue = this / 6;
    final rangeValue = newValue.clamp(min, max);
    return rangeValue.toStringAsFixed(0);
  }
}

extension BytesInt on int {
  List<int> toBytes({int bytesCount=8, Endian endian=Endian.little}) {
    final bytesData = ByteData(bytesCount);
    bytesData.setInt64(0, this, endian);
    return bytesData.buffer.asUint8List();
  }
}
