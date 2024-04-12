import 'package:dartz/dartz.dart';
import 'package:assesment/core/error/failure.dart';

typedef ResultFuture<M> = Future<Either<Failure, M>>;

typedef ResultVoid = Future<Either<Failure, void>>;

typedef ResultFutureDataSource<M> = Future<M>;

typedef DataMap = Map<String, dynamic>;
