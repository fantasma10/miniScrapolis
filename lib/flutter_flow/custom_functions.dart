import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

String cantidadCero(String valor) {
  if (valor == "") {
    return "0";
  }
  if (valor.isEmpty) {
    return "0";
  } else {
    return valor;
  }
}
