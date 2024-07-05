import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import this package to format the date
import 'package:quiz_app/flutter_flow/flutter_flow_util.dart';

import '../components/pages/calender_screen/calender_screen_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class NewGuidelineCasesWidget extends StatefulWidget {
  final String category;

  NewGuidelineCasesWidget({Key? key, required this.category}) : super(key: key);

  @override
  State<NewGuidelineCasesWidget> createState() =>
      _NewGuidelineCasesWidgetState();
}

class _NewGuidelineCasesWidgetState extends State<NewGuidelineCasesWidget> {
  DateTime? _selectedDate;
  int? _selectedYear;

  String _formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yy');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Center(
                  child: Text(
                    'New Guideline Cases',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 23.0),
                child: Text(
                  'Filter By',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    color: const Color(0xFF103358),
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                          child: InkWell(
                            onTap: () async {
                              DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101),
                              );
                              if (picked != null) {
                                setState(() {
                                  _selectedDate = picked;
                                });
                              }
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 1.0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      _selectedDate != null
                                          ? _formatDate(_selectedDate!)
                                          : 'Date',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Poppins',
                                        color: const Color(0xFF103358),
                                        letterSpacing: 0.0,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.date_range_outlined,
                                      color: Color(0xFF18A0FB),
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                          child: InkWell(
                            onTap: () async {
                              DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2024),
                                lastDate: DateTime(2125),
                                helpText: 'Select Year',
                                fieldLabelText: 'Year',
                                initialDatePickerMode: DatePickerMode.year,
                              );
                              if (picked != null) {
                                setState(() {
                                  _selectedYear = picked.year;
                                });
                              }
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 1.0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      _selectedYear != null
                                          ? '$_selectedYear'
                                          : 'Year',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Poppins',
                                        color: const Color(0xFF103358),
                                        letterSpacing: 0.0,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.date_range_outlined,
                                      color: Color(0xFF18A0FB),
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  width: double.infinity,
                  height: 52,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Color(0xFF18A0FB),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CalenderScreenWidget(selectedDate: _selectedDate),
                        ),
                      );
                      print(_selectedDate != null ? _formatDate(_selectedDate!) : 'No date selected');
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    child: Text(
                      'Find Result',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 1.333,
                        letterSpacing: -0.24,
                        color: Colors.white,
                      ),
                    ),
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
