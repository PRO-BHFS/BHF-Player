import 'dart:io';

int countIsolates() =>
    (Platform.numberOfProcessors - 1) == 0 ? 1 : Platform.numberOfProcessors;
