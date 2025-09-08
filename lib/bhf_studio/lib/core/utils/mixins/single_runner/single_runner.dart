mixin SingleRunner {
  bool isBusy = false;
  Future<void> runIfNotBusy(Future<void> Function() action) async {
    if (isBusy) return;
    isBusy = true;
    try {
      await action();
    } finally {
      isBusy = false;
    }
  }
}
