import 'package:flutter/material.dart';
import 'package:frontend/data/repositories/note_repository_impl.dart';
import 'package:frontend/data/repositories/program_point_repository_impl.dart';
import 'package:frontend/domain/entities/program_point.dart';
import 'package:frontend/domain/repositories/note_repository.dart';
import 'package:frontend/domain/repositories/program_point_repository.dart';
import 'package:frontend/domain/usecases/get_next_program_point.dart';
import 'package:frontend/domain/usecases/save_note.dart';

class Notation extends StatefulWidget {
  Notation({
    required this.sessionNumber,
    Key? key
  }) : super(key: key);

  final String sessionNumber;  
  final NoteRepository noteRepository = NoteRepositoryImpl();
  final ProgramPointRepository programPointRepository = ProgramPointRepositoryImpl();

  late SaveNote saveNote = SaveNote(noteRepository);
  late GetNextProgramPoint getNextProgramPoint = GetNextProgramPoint(programPointRepository);

  @override
  State<Notation> createState() => _NotationState();
}

class _NotationState extends State<Notation> {

  bool _isSaving = false;
  late ProgramPoint _programPoint;

  void onNoteProgramPoint(int result) {
    setState(() {
      _isSaving = true;
    });

    final saveNoteParams = SaveNoteParams(
      programPointId: _programPoint.id, 
      result: result, 
      sessionNumber: widget.sessionNumber
    );

    final getNextProgramPointParams = GetNextProgramPointParams(
      sessionNumber: widget.sessionNumber
    );

    widget.saveNote.execute(saveNoteParams).then((_) {
      widget.getNextProgramPoint.execute(getNextProgramPointParams).then((programPoint) {
        setState(() {
          _programPoint = programPoint;
        });
      });
    }).onError((error, stackTrace) {
      // TODO: handle error
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _programPoint.title,
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            _programPoint.description,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Row(
            children: [
              const Text("Not on my watch!"),
              ElevatedButton(
                  onPressed: () => onNoteProgramPoint(1), child: const Text('1')),
              ElevatedButton(
                  onPressed: () => onNoteProgramPoint(2), child: const Text('2')),
              ElevatedButton(
                  onPressed: () => onNoteProgramPoint(3), child: const Text('3')),
              ElevatedButton(
                  onPressed: () => onNoteProgramPoint(4), child: const Text('4')),
              const Text("Fully Agree"),
            ],
          )
        ],
      ),
    );
  }
}
