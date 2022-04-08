import 'package:frontend/domain/entities/program_point.dart';
import 'package:frontend/domain/repositories/program_point_repository.dart';

class GetNextProgramPointParams {
  final String sessionNumber;

  const GetNextProgramPointParams({
    required this.sessionNumber,
  });
}

class GetNextProgramPoint {
  final ProgramPointRepository programPointRepository;

  const GetNextProgramPoint(this.programPointRepository);

  Future<ProgramPoint> execute(GetNextProgramPointParams params) async {
    return programPointRepository.getNextProgramPoint(params.sessionNumber);
  }
}