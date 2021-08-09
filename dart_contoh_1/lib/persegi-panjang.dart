class PersegiPanjang {
  double _panjang;
  double _lebar;

  void setPanjang(double value) {
    if (value < 0) {
      value *= -1;
    }
    _panjang = value;
  }

  set lebar(double value) {
    if (value < 0) {
      value *= -1;
    }
    _lebar = value;
  }

  double get lebar => _lebar;

  double getPanjang() {
    return _panjang;
  }

  double hitungLuas() {
    return _panjang * _lebar;
  }

  double get luas => _panjang * _lebar;
}
