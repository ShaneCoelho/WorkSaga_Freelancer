
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HomePageWidget extends StatefulWidget {
//   const HomePageWidget({Key key}) : super(key: key);

//   @override
//   _HomePageWidgetState createState() => _HomePageWidgetState();
// }

// class _HomePageWidgetState extends State<HomePageWidget> {
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(120),
//         child: AppBar(
//           backgroundColor: Colors.transparent,
//           automaticallyImplyLeading: false,
//           flexibleSpace: Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(25, 42, 200, 0),
//                 child: Text(
//                   'Work Saga',
//                   style: FlutterFlowTheme.of(context).title2.override(
//                         fontFamily: 'Poppins',
//                         color: FlutterFlowTheme.of(context).secondaryColor,
//                         fontSize: 24,
//                         fontWeight: FontWeight.w800,
//                       ),
//                 ),
//               ),
//               Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(24, 5, 0, 0),
//                         child: Icon(
//                           Icons.add_location_alt_outlined,
//                           color: FlutterFlowTheme.of(context).secondaryColor,
//                           size: 24,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
//                         child: Text(
//                           'Vasai-Virar, Maharashtra',
//                           style: FlutterFlowTheme.of(context)
//                               .bodyText1
//                               .override(
//                                 fontFamily: 'Poppins',
//                                 color:
//                                     FlutterFlowTheme.of(context).secondaryColor,
//                               ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
//                         child: FFButtonWidget(
//                           onPressed: () {
//                             print('Button pressed ...');
//                           },
//                           text: 'Complete your profile?',
//                           options: FFButtonOptions(
//                             width: 200,
//                             height: 40,
//                             color:
//                                 FlutterFlowTheme.of(context).primaryBackground,
//                             textStyle:
//                                 FlutterFlowTheme.of(context).subtitle2.override(
//                                       fontFamily: 'Poppins',
//                                       color: FlutterFlowTheme.of(context)
//                                           .secondaryColor,
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                             borderSide: BorderSide(
//                               color: Colors.transparent,
//                               width: 1,
//                             ),
//                             borderRadius: 12,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           actions: [],
//           elevation: 2,
//         ),
//       ),
//       backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//       body: SafeArea(
//         child: GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [],
//           ),
//         ),
//       ),
//     );
//   }
// }
