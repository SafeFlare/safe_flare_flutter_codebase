import 'package:flutter/material.dart';

InputDecoration inpDec = InputDecoration( 
  hintText: 'deskripsi',
  border: InputBorder.none,
  filled: true,
  fillColor: Colors.grey[300],
  enabledBorder: OutlineInputBorder( 
    borderSide: BorderSide(color: Colors.black),
    borderRadius: BorderRadius.circular(8)
  ),
  focusedBorder: OutlineInputBorder( 
    borderSide: BorderSide(color: Colors.blue),
    borderRadius: BorderRadius.circular(8)
  ),
  contentPadding: const EdgeInsets.only(left: 14, top: 8, bottom: 6)
);