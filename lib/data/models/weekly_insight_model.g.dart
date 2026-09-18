// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_insight_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWeeklyInsightModelCollection on Isar {
  IsarCollection<WeeklyInsightModel> get weeklyInsightModels =>
      this.collection();
}

const WeeklyInsightModelSchema = CollectionSchema(
  name: r'WeeklyInsightModel',
  id: 2290496390911941571,
  properties: {
    r'avgSentiment': PropertySchema(
      id: 0,
      name: r'avgSentiment',
      type: IsarType.double,
    ),
    r'entryCount': PropertySchema(
      id: 1,
      name: r'entryCount',
      type: IsarType.long,
    ),
    r'topKeywords': PropertySchema(
      id: 2,
      name: r'topKeywords',
      type: IsarType.stringList,
    ),
    r'weekStart': PropertySchema(
      id: 3,
      name: r'weekStart',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _weeklyInsightModelEstimateSize,
  serialize: _weeklyInsightModelSerialize,
  deserialize: _weeklyInsightModelDeserialize,
  deserializeProp: _weeklyInsightModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'weekStart': IndexSchema(
      id: 6730028936290595099,
      name: r'weekStart',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'weekStart',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _weeklyInsightModelGetId,
  getLinks: _weeklyInsightModelGetLinks,
  attach: _weeklyInsightModelAttach,
  version: '3.3.2',
);

int _weeklyInsightModelEstimateSize(
  WeeklyInsightModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.topKeywords.length * 3;
  {
    for (var i = 0; i < object.topKeywords.length; i++) {
      final value = object.topKeywords[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _weeklyInsightModelSerialize(
  WeeklyInsightModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.avgSentiment);
  writer.writeLong(offsets[1], object.entryCount);
  writer.writeStringList(offsets[2], object.topKeywords);
  writer.writeDateTime(offsets[3], object.weekStart);
}

WeeklyInsightModel _weeklyInsightModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WeeklyInsightModel();
  object.avgSentiment = reader.readDouble(offsets[0]);
  object.entryCount = reader.readLong(offsets[1]);
  object.id = id;
  object.topKeywords = reader.readStringList(offsets[2]) ?? [];
  object.weekStart = reader.readDateTime(offsets[3]);
  return object;
}

P _weeklyInsightModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _weeklyInsightModelGetId(WeeklyInsightModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _weeklyInsightModelGetLinks(
  WeeklyInsightModel object,
) {
  return [];
}

void _weeklyInsightModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  WeeklyInsightModel object,
) {
  object.id = id;
}

extension WeeklyInsightModelByIndex on IsarCollection<WeeklyInsightModel> {
  Future<WeeklyInsightModel?> getByWeekStart(DateTime weekStart) {
    return getByIndex(r'weekStart', [weekStart]);
  }

  WeeklyInsightModel? getByWeekStartSync(DateTime weekStart) {
    return getByIndexSync(r'weekStart', [weekStart]);
  }

  Future<bool> deleteByWeekStart(DateTime weekStart) {
    return deleteByIndex(r'weekStart', [weekStart]);
  }

  bool deleteByWeekStartSync(DateTime weekStart) {
    return deleteByIndexSync(r'weekStart', [weekStart]);
  }

  Future<List<WeeklyInsightModel?>> getAllByWeekStart(
    List<DateTime> weekStartValues,
  ) {
    final values = weekStartValues.map((e) => [e]).toList();
    return getAllByIndex(r'weekStart', values);
  }

  List<WeeklyInsightModel?> getAllByWeekStartSync(
    List<DateTime> weekStartValues,
  ) {
    final values = weekStartValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'weekStart', values);
  }

  Future<int> deleteAllByWeekStart(List<DateTime> weekStartValues) {
    final values = weekStartValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'weekStart', values);
  }

  int deleteAllByWeekStartSync(List<DateTime> weekStartValues) {
    final values = weekStartValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'weekStart', values);
  }

  Future<Id> putByWeekStart(WeeklyInsightModel object) {
    return putByIndex(r'weekStart', object);
  }

  Id putByWeekStartSync(WeeklyInsightModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'weekStart', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByWeekStart(List<WeeklyInsightModel> objects) {
    return putAllByIndex(r'weekStart', objects);
  }

  List<Id> putAllByWeekStartSync(
    List<WeeklyInsightModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'weekStart', objects, saveLinks: saveLinks);
  }
}

extension WeeklyInsightModelQueryWhereSort
    on QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QWhere> {
  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterWhere>
  anyWeekStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'weekStart'),
      );
    });
  }
}

extension WeeklyInsightModelQueryWhere
    on QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QWhereClause> {
  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterWhereClause>
  weekStartEqualTo(DateTime weekStart) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'weekStart', value: [weekStart]),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterWhereClause>
  weekStartNotEqualTo(DateTime weekStart) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'weekStart',
                lower: [],
                upper: [weekStart],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'weekStart',
                lower: [weekStart],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'weekStart',
                lower: [weekStart],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'weekStart',
                lower: [],
                upper: [weekStart],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterWhereClause>
  weekStartGreaterThan(DateTime weekStart, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'weekStart',
          lower: [weekStart],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterWhereClause>
  weekStartLessThan(DateTime weekStart, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'weekStart',
          lower: [],
          upper: [weekStart],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterWhereClause>
  weekStartBetween(
    DateTime lowerWeekStart,
    DateTime upperWeekStart, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'weekStart',
          lower: [lowerWeekStart],
          includeLower: includeLower,
          upper: [upperWeekStart],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension WeeklyInsightModelQueryFilter
    on QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QFilterCondition> {
  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  avgSentimentEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'avgSentiment',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  avgSentimentGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'avgSentiment',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  avgSentimentLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'avgSentiment',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  avgSentimentBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'avgSentiment',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  entryCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'entryCount', value: value),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  entryCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'entryCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  entryCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'entryCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  entryCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'entryCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  topKeywordsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'topKeywords',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  topKeywordsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'topKeywords',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  topKeywordsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'topKeywords',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  topKeywordsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'topKeywords',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  topKeywordsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'topKeywords',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  topKeywordsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'topKeywords',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  topKeywordsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'topKeywords',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  topKeywordsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'topKeywords',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  topKeywordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'topKeywords', value: ''),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  topKeywordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'topKeywords', value: ''),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  topKeywordsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'topKeywords', length, true, length, true);
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  topKeywordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'topKeywords', 0, true, 0, true);
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  topKeywordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'topKeywords', 0, false, 999999, true);
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  topKeywordsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'topKeywords', 0, true, length, include);
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  topKeywordsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'topKeywords', length, include, 999999, true);
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  topKeywordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'topKeywords',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  weekStartEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'weekStart', value: value),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  weekStartGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'weekStart',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  weekStartLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'weekStart',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterFilterCondition>
  weekStartBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'weekStart',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension WeeklyInsightModelQueryObject
    on QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QFilterCondition> {}

extension WeeklyInsightModelQueryLinks
    on QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QFilterCondition> {}

extension WeeklyInsightModelQuerySortBy
    on QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QSortBy> {
  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterSortBy>
  sortByAvgSentiment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgSentiment', Sort.asc);
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterSortBy>
  sortByAvgSentimentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgSentiment', Sort.desc);
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterSortBy>
  sortByEntryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryCount', Sort.asc);
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterSortBy>
  sortByEntryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryCount', Sort.desc);
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterSortBy>
  sortByWeekStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStart', Sort.asc);
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterSortBy>
  sortByWeekStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStart', Sort.desc);
    });
  }
}

extension WeeklyInsightModelQuerySortThenBy
    on QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QSortThenBy> {
  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterSortBy>
  thenByAvgSentiment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgSentiment', Sort.asc);
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterSortBy>
  thenByAvgSentimentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgSentiment', Sort.desc);
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterSortBy>
  thenByEntryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryCount', Sort.asc);
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterSortBy>
  thenByEntryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryCount', Sort.desc);
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterSortBy>
  thenByWeekStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStart', Sort.asc);
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QAfterSortBy>
  thenByWeekStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStart', Sort.desc);
    });
  }
}

extension WeeklyInsightModelQueryWhereDistinct
    on QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QDistinct> {
  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QDistinct>
  distinctByAvgSentiment() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avgSentiment');
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QDistinct>
  distinctByEntryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entryCount');
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QDistinct>
  distinctByTopKeywords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'topKeywords');
    });
  }

  QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QDistinct>
  distinctByWeekStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weekStart');
    });
  }
}

extension WeeklyInsightModelQueryProperty
    on QueryBuilder<WeeklyInsightModel, WeeklyInsightModel, QQueryProperty> {
  QueryBuilder<WeeklyInsightModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WeeklyInsightModel, double, QQueryOperations>
  avgSentimentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avgSentiment');
    });
  }

  QueryBuilder<WeeklyInsightModel, int, QQueryOperations> entryCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entryCount');
    });
  }

  QueryBuilder<WeeklyInsightModel, List<String>, QQueryOperations>
  topKeywordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'topKeywords');
    });
  }

  QueryBuilder<WeeklyInsightModel, DateTime, QQueryOperations>
  weekStartProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weekStart');
    });
  }
}
