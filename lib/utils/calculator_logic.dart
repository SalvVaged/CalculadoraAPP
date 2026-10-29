class CalculatorLogic {
  String _display = '0';
  double? _firstOperand;
  String? _pendingOp;
  bool _newNumber = true;

  String get display => _display;

  void inputDigit(String digit) {
    if (_newNumber) {
      _display = digit;
      _newNumber = false;
    } else {
      _display = (_display == '0') ? digit : _display + digit;
    }
  }

  void inputDecimal() {
    if (_newNumber) {
      _display = '0.';
      _newNumber = false;
    } else if (!_display.contains('.')) {
      _display += '.';
    }
  }

  void setOperator(String op) {
    if (_pendingOp != null && !_newNumber) {
      _calculate();
    }
    _firstOperand = double.tryParse(_display);
    _pendingOp = op;
    _newNumber = true;
  }

  void _calculate() {
    if (_firstOperand == null || _pendingOp == null) return;
    final second = double.tryParse(_display) ?? 0;
    double result;
    switch (_pendingOp) {
      case '+':
        result = _firstOperand! + second;
        break;
      case '-':
        result = _firstOperand! - second;
        break;
      case '×':
        result = _firstOperand! * second;
        break;
      case '÷':
        result = second == 0 ? double.nan : _firstOperand! / second;
        break;
      default:
        return;
    }
    _display = result.isNaN
        ? 'Error :p'
        : (result == result.roundToDouble()
            ? result.toInt().toString()
            : result.toString());
    _firstOperand = result;
  }

  void equals() {
    _calculate();
    _pendingOp = null;
    _newNumber = true;
  }

  /// C — borra un solo dígito
  void clearC() {
    if (_display.length <= 1) {
      _display = '0';
      _newNumber = true;
    } else {
      _display = _display.substring(0, _display.length - 1);
    }
  }

  /// CE — borra todo
  void clearAll() {
    _display = '0';
    _firstOperand = null;
    _pendingOp = null;
    _newNumber = true;
  }
}