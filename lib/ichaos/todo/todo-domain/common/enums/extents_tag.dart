
// ignore: constant_identifier_names
enum TagSortFlag { LOWER, NORMAL, HIGH, HIGHEST }

final tagSortFlags = {
  TagSortFlag.LOWER: -1, // 优先级低
  TagSortFlag.NORMAL: 0, // 普通
  TagSortFlag.HIGH: 100, // 优先级较高
  TagSortFlag.HIGHEST: 999 // 优先级最高
};

/// 事件等级标签
//final Tag deferrableLevelTag = Tag.extend(-12, TodoLevel.deferrable.title, tagSortFlags[TagSortFlag.LOWER]!);
//final Tag importantLevelTag = Tag.extend(-11, TodoLevel.important.title, tagSortFlags[TagSortFlag.HIGH]!);
//final Tag urgentLevelTag = Tag.extend(-10, TodoLevel.important.title, tagSortFlags[TagSortFlag.HIGHEST]!);
//
///// 事件周期规则标签
//final Tag monTag = Tag.extend(-1, Period.day_1.desc, tagSortFlags[TagSortFlag.NORMAL]!);
//final Tag tueTag = Tag.extend(-2, Period.day_2.desc, tagSortFlags[TagSortFlag.NORMAL]!);
//final Tag wedTag = Tag.extend(-3, Period.day_3.desc, tagSortFlags[TagSortFlag.NORMAL]!);
//final Tag thuTag = Tag.extend(-4, Period.day_4.desc, tagSortFlags[TagSortFlag.NORMAL]!);
//final Tag friTag = Tag.extend(-5, Period.day_5.desc, tagSortFlags[TagSortFlag.NORMAL]!);
//final Tag satTag = Tag.extend(-6, Period.day_6.desc, tagSortFlags[TagSortFlag.NORMAL]!);
//final Tag sunTag = Tag.extend(-7, Period.day_7.desc, tagSortFlags[TagSortFlag.NORMAL]!);
//final Tag everyTag = Tag.extend(-8, Period.day_n.desc, tagSortFlags[TagSortFlag.NORMAL]!);
//
//// 扩展标签辅助类
//class ExtentsTags {
//  static Map<String, Tag> extents() {
//    return {
//      TodoLevel.deferrable.desc: deferrableLevelTag,
//      TodoLevel.important.desc: importantLevelTag,
//      TodoLevel.urgent.desc: urgentLevelTag,
//      Period.day_1.abbr: monTag,
//      Period.day_2.abbr: tueTag,
//      Period.day_3.abbr: wedTag,
//      Period.day_4.abbr: thuTag,
//      Period.day_5.abbr: friTag,
//      Period.day_6.abbr: satTag,
//      Period.day_7.abbr: sunTag,
//      Period.day_n.abbr: everyTag
//    };
//  }
//}
