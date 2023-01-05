// ignore_for_file: constant_identifier_names

import 'package:unleash_proxy_client_flutter/constraint_model.dart';
import 'package:version/version.dart';

class ConstraintParser {
  final Constraint constraint;
  final String userValue;
  // final List<String> userValues;

  ConstraintParser({
    required this.userValue,
    required this.constraint,
    // this.values = const [],
  });

  //main method
  bool parse() {
    var result = false;
    switch (constraint.constraintParserOperator) {
      case ConstraintOperator.IN:
        result = _inOperator();
        break;
      case ConstraintOperator.NOT_IN:
        result = _notInOperator();
        break;
      case ConstraintOperator.STR_CONTAINS:
        result = _strContains();
        break;
      case ConstraintOperator.STR_STARTS_WITH:
        result = _strStartsWith();
        break;
      case ConstraintOperator.STR_ENDS_WITH:
        result = _strEndsWith();
        break;
      case ConstraintOperator.NUM_EQ:
        result = _numEqualTo();
        break;
      case ConstraintOperator.NUM_GT:
        result = _numGreaterThan();
        break;
      case ConstraintOperator.NUM_GTE:
        result = _numGreaterThanEqualTo();
        break;
      case ConstraintOperator.NUM_LT:
        result = _numLessThan();
        break;
      case ConstraintOperator.NUM_LTE:
        result = _numLessThanEqualTo();
        break;
      case ConstraintOperator.SEMVER_EQ:
        result = _semVerEqualTo();
        break;
      case ConstraintOperator.SEMVER_GT:
        result = _semVerGreaterThan();
        break;
      case ConstraintOperator.SEMVER_LT:
        result = _semVerLessThan();
        break;
    }
    return constraint.inverted ? !result : result;
  }

  //constraint Parser Operator
  bool _inOperator() {
    for (String c in constraint.values) {
      if (c == userValue) {
        return true;
      }
    }
    return false;
  }

  bool _notInOperator() {
    for (String c in constraint.values) {
      if (c != userValue) {
        return true;
      }
    }
    return false;
  }

  bool _strContains() {
    for (String c in constraint.values) {
      if (userValue.contains(c)) {
        return true;
      }
    }
    return false;
  }

  bool _strStartsWith() {
    for (String c in constraint.values) {
      if (userValue.startsWith(c)) {
        return true;
      }
    }
    return false;
  }

  bool _strEndsWith() {
    for (String c in constraint.values) {
      if (userValue.endsWith(c)) {
        return true;
      }
    }
    return false;
  }

  bool _numEqualTo() {
    return num.parse(userValue) == num.parse(constraint.value);
  }

  bool _numGreaterThan() {
    return num.parse(userValue) > num.parse(constraint.value);
  }

  bool _numGreaterThanEqualTo() {
    return num.parse(userValue) >= num.parse(constraint.value);
  }

  bool _numLessThan() {
    return num.parse(userValue) < num.parse(constraint.value);
  }

  bool _numLessThanEqualTo() {
    if (num.parse(userValue) <= num.parse(constraint.value)) {
      return true;
    }
    return false;
  }

  bool _semVerEqualTo() {
    return Version.parse(userValue) == Version.parse(constraint.value);
  }

  bool _semVerGreaterThan() {
    return Version.parse(userValue) > Version.parse(constraint.value);
  }

  bool _semVerLessThan() {
    return Version.parse(userValue) < Version.parse(constraint.value);
  }
}



// [
//     {
//       "values": [
//         "on"
//       ],
//       "inverted": false,
//       "operator": "IN",
//       "contextName": "test-context",
//       "caseInsensitive": false
//     },
//     {
//       "values": [
//         "first-time-user"
//       ],
//       "inverted": false,
//       "operator": "IN",
//       "contextName": "Experiment",
//       "caseInsensitive": false
//     },
//     {
//       "contextName": "appName",
//       "operator": "IN",
//       "value": "",
//       "values": [],
//       "caseInsensitive": false,
//       "inverted": false
//     }
// ]
