extension MultiSort on List {
  ///
  /// @param rawPropsAscCriteria  升降序标准：升序为true，降序为false
  /// @param rawProps             类属姓名
  ///
  multiPropSort(List<bool> rawPropsAscCriteria, dynamic rawProps) {
    if (rawProps.length == 0 || rawPropsAscCriteria.length == 0 || this.length == 0)
      return this;
    if (rawProps.length != rawPropsAscCriteria.length) {
      print('Criteria length is not equal to rawProps');
      return this;
    }

    ///
    /// 比较a和b的第i个属性
    /// 若a的i属性为null时，则默认b大于的情况，反之
    ///
    int compare(int i, dynamic a, dynamic b) {
      if(a.get(rawProps[i]) == null && b.get(rawProps[i]) == null) {
        return 0;
      }

      if (a.get(rawProps[i]) == null) {
        return rawPropsAscCriteria[i] ? -1 : 1;
      }

      if (b.get(rawProps[i]) == null) {
        return rawPropsAscCriteria[i] ? 1 : -1;
      }

      if (a.get(rawProps[i]) is DateTime && b.get(rawProps[i]) is DateTime) {
        DateTime dateA = a.get(rawProps[i]);
        DateTime dateB = b.get(rawProps[i]);

        if (dateA.compareTo(dateB) == 0)
          return 0;
        else if (dateA.isAfter(dateB))
          return rawPropsAscCriteria[i] ? 1 : -1;
        else
          return rawPropsAscCriteria[i] ? -1 : 1;
      }

      if (a.get(rawProps[i]) == b.get(rawProps[i]))
        return 0;
      else if (a.get(rawProps[i]) > b.get(rawProps[i]))
        return rawPropsAscCriteria[i] ? 1 : -1;
      else
        return rawPropsAscCriteria[i] ? -1 : 1;
    }

    // 所有属性比较，直到传入的最后一个属性
    int sortAll(a, b) {
      int i = 0, result = 0; // 默认相等
      while (i < rawProps.length) {
        result = compare(i, a, b);
        if (result != 0) break;
        i++;
      }
      return result;
    }

    this.sort((a, b) => sortAll(a, b));
  }
}