import '/backend/api_requests/api_calls.dart';
import '/detalle_orden/detalle_orden_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_page/home_page_widget.dart';
import '/menu_principal/menu_principal_widget.dart';
import '/modificar_cantidad/modificar_cantidad_widget.dart';
import '/modificar_precio/modificar_precio_widget.dart';
import 'materiales_widget.dart' show MaterialesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MaterialesModel extends FlutterFlowModel<MaterialesWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (obtenerMateriales)] action in Materiales widget.
  ApiCallResponse? apiiMateriales;
  // Stores action output result for [Backend Call - API (eliminarUsuario)] action in IconButton widget.
  ApiCallResponse? jsonEliminar;
  // Stores action output result for [Backend Call - API (nuevoPedido)] action in IconButton widget.
  ApiCallResponse? responseMaterialesResta;
  // Stores action output result for [Backend Call - API (nuevoPedido)] action in IconButton widget.
  ApiCallResponse? responseMaterialesSuma;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
