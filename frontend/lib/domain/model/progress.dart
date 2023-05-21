

import 'package:frontend/domain/model/base.dart';
import 'package:frontend/domain/model/skill.dart';

class ProgressModel extends IdentifiedModel {

  final String comment;
  final int score;

  ProgressModel(super.id, this.score, this.comment);
}