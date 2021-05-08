class LayerException implements Exception{

  String cause;

  LayerException(this.cause);

  @override
  String toString() {
    return cause;
  }
}