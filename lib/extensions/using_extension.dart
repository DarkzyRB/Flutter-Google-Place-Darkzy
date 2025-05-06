import 'dart:async';
import 'package:rxdart/rxdart.dart';

extension UsingExtension<T> on Stream<T> {
  static Stream<R> using<R, T>(
      T Function() resourceFactory,
      Stream<R> Function(T resource) streamFactory,
      FutureOr<void> Function(T resource) disposer,
      ) {
    return DeferStream<R>(() {
      final resource = resourceFactory();
      final stream = streamFactory(resource);

      final controller = StreamController<R>();

      late StreamSubscription<R> subscription;

      controller.onListen = () {
        subscription = stream.listen(
          controller.add,
          onError: controller.addError,
          onDone: controller.close,
        );
      };

      controller.onCancel = () async {
        await subscription.cancel();
        await disposer(resource);
        await controller.close();
      };

      return controller.stream;
    });
  }
}
