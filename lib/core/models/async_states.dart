import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_states.freezed.dart';

@freezed
class AsyncState<T> with _$AsyncState<T> {
  const factory AsyncState.loading() = AsyncLoading<T>;
  const factory AsyncState.data(T value) = AsyncData<T>;
  const factory AsyncState.error(Object error) = AsyncError<T>;
}
