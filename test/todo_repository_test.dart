import 'package:clean_pattern/data/remote/todos_remote.dart';
import 'package:clean_pattern/domain/entities/response/todos_response.dart';
import 'package:clean_pattern/domain/repositories/todo_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mocked implementations
class MockedTodoRepositoryImpl extends Mock implements TodoRepository {
  MockedTodoRepositoryImpl(MockedTodoRemoteImpl todoRemoteData);
}
class MockedTodoRemoteImpl extends Mock implements TodoRemote {}

class MockResponse extends Mock implements Response {}

void main() {
  late MockedTodoRepositoryImpl sut; // Service Under Test
  late MockedTodoRemoteImpl todoRemoteData; // Service dependency

  setUp(() {
    todoRemoteData = MockedTodoRemoteImpl();
    sut = MockedTodoRepositoryImpl(todoRemoteData);
  });

  group('getTodos', () {
    test("get todos using Todo remote impl", () async {

        // Arrange
        when(() => sut.getTodos())
          .thenAnswer((_) async => []);

        // Act
        await sut.getTodos();

        // Assert
        verify(() => sut.getTodos()).called(1);
    });
  });

}