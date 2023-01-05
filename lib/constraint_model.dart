// ignore_for_file: constant_identifier_names

class Constraint {
  List<String> values;
  bool inverted;
  ConstraintOperator constraintParserOperator;
  String contextName;
  bool caseInsensitive;
  String value;

  Constraint({
    required this.values,
    required this.inverted,
    required this.constraintParserOperator,
    required this.contextName,
    required this.caseInsensitive,
    required this.value,
  });
}

enum ConstraintOperator {
  IN,
  NOT_IN,
  STR_CONTAINS,
  STR_STARTS_WITH,
  STR_ENDS_WITH,
  NUM_EQ,
  NUM_GT,
  NUM_GTE,
  NUM_LT,
  NUM_LTE,
  SEMVER_EQ,
  SEMVER_GT,
  SEMVER_LT,
}
