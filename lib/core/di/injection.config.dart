// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/tasks/data/data_source/task_data_local_source.dart'
    as _i3;
import '../../features/tasks/data/repository/task_repository_impl.dart' as _i5;
import '../../features/tasks/domain/repositories/task_respository.dart' as _i4;
import '../../features/tasks/presentation/bloc/tasks_cubit/tasks_cubit.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.TaskDataLocalDataSource>(
        () => _i3.TaskDataLocalDataSourceImpl());
    gh.factory<_i4.TaskRepository>(() => _i5.TaskRepositoryImpl(
        taskDataLocalDataSource: gh<_i3.TaskDataLocalDataSource>()));
    gh.factory<_i6.TasksCubit>(() => _i6.TasksCubit(gh<_i4.TaskRepository>()));
    return this;
  }
}
