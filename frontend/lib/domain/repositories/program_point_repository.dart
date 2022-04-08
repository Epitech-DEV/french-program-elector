
import 'package:frontend/domain/entities/program_point.dart';

abstract class ProgramPointRepository {
  Future<ProgramPoint> getNextProgramPoint(String sessionNumber);
}