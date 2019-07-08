import 'package:flutter/material.dart';
import 'package:flutter_app/Source/Resource/Model/DeviceData.dart';

 class ItemDevice {
  final DeviceData _deviceData;

  ItemDevice(this._deviceData);

  Card buildItemDevice() {
    return Card(
      elevation: 3.0,
      child: ListTile(
        leading:
        CircleAvatar(
          backgroundImage: _deviceData.imageDevice,
        ),
        title: Text(_deviceData.nameDevice),
        subtitle: Text(_deviceData.nameOwner),
      ),
    );
  }
}