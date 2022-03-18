// return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * 1,
//             decoration: BoxDecoration(
//               color: Color(0xFFEEEEEE),
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Container(
//                     height: MediaQuery.of(context).size.height * 0.3,
//                     child: Stack(
//                       children: [
//                         Image.network(
//                           'https://picsum.photos/seed/186/600',
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height * 0.2,
//                           fit: BoxFit.cover,
//                         ),
//                         Align(
//                           alignment: AlignmentDirectional(0.91, 0.73),
//                           child: FlutterFlowIconButton(
//                             borderColor: Colors.transparent,
//                             borderRadius: 30,
//                             borderWidth: 1,
//                             buttonSize: 60,
//                             icon: Icon(
//                               Icons.edit_rounded,
//                               color: Colors.black,
//                               size: 30,
//                             ),
//                             onPressed: () {
//                               print('IconButton pressed ...');
//                             },
//                           ),
//                         ),
//                         Align(
//                           alignment: AlignmentDirectional(-0.72, 0.86),
//                           child: Container(
//                             width: 152,
//                             height: 152,
//                             clipBehavior: Clip.antiAlias,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                             ),
//                             child: Image.network(
//                               'https://picsum.photos/seed/132/600',
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Align(
//                     alignment: AlignmentDirectional(0, 0),
//                     child: Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Puspa Patel',
//                             textAlign: TextAlign.start,
//                             style: FlutterFlowTheme.of(context).title1.override(
//                                   fontFamily: 'Poppins',
//                                   fontSize: 24,
//                                 ),
//                           ),
//                           Text(
//                             'Keep your team connected with enterprise-grade video conferencing.',
//                             textAlign: TextAlign.start,
//                             style:
//                                 FlutterFlowTheme.of(context).bodyText1.override(
//                                       fontFamily: 'Poppins',
//                                       fontSize: 17,
//                                     ),
//                           ),
//                           Divider(
//                             height: 5,
//                             color: Color(0xFFF4EDED),
//                           ),
//                           Text(
//                             'Mumbai, Maharashtra, India',
//                             style: FlutterFlowTheme.of(context).bodyText1,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Column(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Divider(
//                         height: 20,
//                         thickness: 15,
//                         color: Color(0xFFFBF6EF),
//                       ),
//                       Column(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Padding(
//                             padding:
//                                 EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Icon(
//                                   Icons.email,
//                                   color: Colors.black,
//                                   size: 24,
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       12, 0, 0, 0),
//                                   child: Text(
//                                     'Hello World',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyText1
//                                         .override(
//                                           fontFamily: 'Poppins',
//                                           fontSize: 15,
//                                         ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                                 EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               children: [
//                                 Icon(
//                                   Icons.call,
//                                   color: Colors.black,
//                                   size: 24,
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       12, 0, 0, 0),
//                                   child: Text(
//                                     'Hello World',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyText1
//                                         .override(
//                                           fontFamily: 'Poppins',
//                                           fontSize: 15,
//                                           lineHeight: 2,
//                                         ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                                 EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               children: [
//                                 Icon(
//                                   Icons.home,
//                                   color: Colors.black,
//                                   size: 24,
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       12, 0, 0, 0),
//                                   child: Text(
//                                     'Hello World',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyText1
//                                         .override(
//                                           fontFamily: 'Poppins',
//                                           fontSize: 15,
//                                         ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Column(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Divider(
//                         height: 20,
//                         thickness: 15,
//                         color: Color(0xFFFBF6EF),
//                       ),
//                       Column(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Padding(
//                             padding:
//                                 EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Icon(
//                                   Icons.settings,
//                                   color: Colors.black,
//                                   size: 24,
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       12, 0, 0, 0),
//                                   child: Text(
//                                     'Setting',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyText1
//                                         .override(
//                                           fontFamily: 'Poppins',
//                                           fontSize: 15,
//                                         ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Column(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Divider(
//                         height: 190,
//                         thickness: 190,
//                         color: Color(0xFFFBF6EF),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }