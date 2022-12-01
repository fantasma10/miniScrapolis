import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../materiales/materiales_widget.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketWidget extends StatefulWidget {
  const TicketWidget({
    Key? key,
    this.id,
    this.fecha,
    this.nombre,
    this.email,
    this.total,
    this.tipoNav,
  }) : super(key: key);

  final String? id;
  final String? fecha;
  final String? nombre;
  final String? email;
  final String? total;
  final String? tipoNav;

  @override
  _TicketWidgetState createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primariBagGroudBtn,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            if (widget.tipoNav == 'F') {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MaterialesWidget(),
                ),
              );
            } else {
              Navigator.pop(context);
            }
          },
        ),
        title: Text(
          'Imprimir ticket',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    child: custom_widgets.ImprimeTickets(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      nombre: widget.nombre!,
                      email: widget.email!,
                      total: widget.total!,
                      listadoArticulos: getJsonField(
                        FFAppState().jsonHistorialDetalle,
                        r'''$''',
                      ),
                      fecha: widget.fecha!,
                      id: widget.id!,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
