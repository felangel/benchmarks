import 'package:bloc/bloc.dart';
import 'package:benckmark/item.dart';

part 'items_event.dart';

class ItemsBloc extends Bloc<ItemsEvent, List<Item>> {
  @override
  List<Item> get initialState => sampleItems;

  @override
  Stream<List<Item>> mapEventToState(ItemsEvent event) async* {
    if (event is AddItemEvent) {
      yield List.from(state)..add(event.item);
    }
  }
}
