import 'package:frontend/domain/entities/note.dart';
import 'package:frontend/domain/repositories/note_repository.dart';

class SaveNoteParams {
  final String programPointId;
  final int result;
  final String sessionNumber;

  const SaveNoteParams({
    required this.programPointId,
    required this.result,
    required this.sessionNumber,
  });
}

class SaveNote {
  final NoteRepository noteRepository;

  const SaveNote(this.noteRepository);

  Future<void> execute(SaveNoteParams params) async {
    final note = Note(
      programPointId: params.programPointId,
      value: params.result,
      sessionNumber: params.sessionNumber,
    );

    await noteRepository.save(note);
  }
}