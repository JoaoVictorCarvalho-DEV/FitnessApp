final String tableTreinos = 'treinos';

class TreinoField {
  static final String id = '_id';
  static final String titulo = 'titulo';
  static final String validade  = 'validade';
  static final String ultimoTreino = 'ultimoTreino';
  static final String tempoMedio  = 'tempoMedio';
  static final String createdAt = 'createdAt';
  static final String updatedAt = 'updatedAt';
}

class Treino {
  final int? id;
  final String titulo;
  final String tempoMedio;
  final DateTime validade;
  final DateTime ultimoTreino;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Treino({
    this.id,
    required this.titulo,
    required this.tempoMedio,
    required this.validade,
    required this.ultimoTreino,
    required this.createdAt,
    required this.updatedAt
  });
}
