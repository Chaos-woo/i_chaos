
// 按钮下次的展示文案
typedef VarBtnPredictor = String? Function(int nextIndex, VarBtnStatus currStatus);

// 文案可变按钮
class VariableButtonLabel {
  // 文案可变按钮的下标
  final int varButtonIndex;
  // 该文案在何种情况下展现何种文案，返回null时默认展示按钮的初始文案
  final VarBtnPredictor varBtnPredictor;

  VariableButtonLabel(this.varButtonIndex, this.varBtnPredictor);
}

enum VarBtnStatus {
  selected,
  unSelected
}