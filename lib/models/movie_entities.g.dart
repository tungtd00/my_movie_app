// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entities.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieEntitiesAdapter extends TypeAdapter<MovieEntities> {
  @override
  final int typeId = 0;

  @override
  MovieEntities read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieEntities(
      id: fields[0] as int?,
      title: fields[1] as String?,
      director: fields[2] as String?,
      year: fields[3] as int?,
      url: fields[4] as String?,
      image: fields[5] as String?,
      description: fields[6] as String?,
      types: (fields[7] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, MovieEntities obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.director)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.types);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieEntitiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
