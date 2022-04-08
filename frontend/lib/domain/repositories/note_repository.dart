import 'package:frontend/domain/entities/note.dart';

abstract class NoteRepository {
  Future<void> save(Note note);
}