import 'package:flutter/material.dart';
import 'dart:collection';

import 'package:rxdart/rxdart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkbox Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApplicationBloc _bloc = new ApplicationBloc();

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Test'),
      ),
      body: StreamBuilder(
        stream: _bloc.listItemModel,
        builder:
            (BuildContext context, AsyncSnapshot<List<ItemModel>> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          List<ItemModel> listItemModel = snapshot.data;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: listItemModel.length,
            itemBuilder: (context, index) {
              ItemModel itemModel = listItemModel[index];
              return ListTile(
                leading: _checkbox(_bloc, itemModel.id),
                title: Text('${itemModel.name}'),
              );
            },
          );
        },
      ),
    );
  }

  _checkbox(ApplicationBloc _bloc, int idItemModel) {
    // This doesn't render like expected
    return StreamBuilder(
      stream: _bloc.checkboxController,
      builder: (BuildContext context, AsyncSnapshot<Map<int, bool>> snapshot) {
        if (snapshot.hasData) {
          return Checkbox(
            tristate: true,
            value: snapshot.data[idItemModel],
            onChanged: (value) => _bloc.setCheckbox(
              <int, bool>{idItemModel: value},
            ),
          );
        } else
          return Container();
      },
    );
  }
}

class ItemModel {
  int id;
  String name;
  ItemModel(this.id, this.name);
}

class ApplicationBloc {
  // List Management
  BehaviorSubject<List<ItemModel>> listModelController =
  BehaviorSubject<List<ItemModel>>();
  Observable<List<ItemModel>> get listItemModel => listModelController.stream;

  // Checkbox Management - Item Model ID and checkbox value
  BehaviorSubject<Map<int, bool>> checkboxController =
  BehaviorSubject<Map<int, bool>>();
  Observable<Map<int, bool>> get mapModelCheckbox => checkboxController.stream;
  Function(Map<int, bool>) get setCheckbox => checkboxController.sink.add;

  List<ItemModel> _listItemModel = List<ItemModel>();
  Map<int, bool> _mapCheckbox = HashMap<int, bool>();

  ApplicationBloc() {
    // Initial data for list and map
    _listItemModel.add(ItemModel(1, 'Item Model 1'));
    _mapCheckbox[1] = false;
    _listItemModel.add(ItemModel(2, 'Item Model 2'));
    _mapCheckbox[2] = false;
    _listItemModel.add(ItemModel(3, 'Item Model 3'));
    _mapCheckbox[3] = false;

    // Insert initial data in controller
    listModelController.add(_listItemModel);
    checkboxController.add(_mapCheckbox);

    // Handler for checkbox state
    checkboxController.stream.listen(setCheckboxHandler);
  }

  setCheckboxHandler(Map<int, bool> newMapCheckbox) {
    // New checkbox value for the itemModel id
    int id = newMapCheckbox.entries.elementAt(0).key;
    bool check = newMapCheckbox.entries.elementAt(0).value;
    if (_mapCheckbox.containsKey(id)) {
      _mapCheckbox[id] = check;
    }
    print('-----------');
    print('newMapCheckbox: $newMapCheckbox');
    print('_mapCheckbox: $_mapCheckbox');
    print('-----------');
  }

  //dispose/close all the streams when we call dispose() method
  void dispose() {
    listModelController.close();
    checkboxController.close();
  }
}