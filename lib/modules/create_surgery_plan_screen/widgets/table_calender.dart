import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../store/bloc/create_surgery_bloc/create_surgery_bloc.dart';
import '../../../store/bloc/surgery_staff_bloc/surgery_staff_bloc.dart';
import '../../../store/bloc/surgery_staff_bloc/surgery_staff_event.dart';

class TableCalenderWidget extends StatefulWidget {
  const TableCalenderWidget({super.key});

  @override
  State<TableCalenderWidget> createState() => _TableCalenderWidgetState();
}

class _TableCalenderWidgetState extends State<TableCalenderWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.now(),
      lastDay: DateTime(2050),
      focusedDay: DateTime.now(),
      calendarFormat: CalendarFormat.week,
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDate, selectedDay)) {
          // Call `setState()` when updating the selected day
          setState(() {
            _selectedDate = selectedDay;
            context.read<SurgeryStaffBloc>().selectedDate = selectedDay;
            context.read<SurgeryStaffBloc>().add(GetStaffDetailsEvent());
            context.read<CreateSurgeryBloc>().data['surgeryDate'] =
                '${context.read<SurgeryStaffBloc>().selectedDate.toString().split(" ").first}T${context.read<SurgeryStaffBloc>().time!.split(" ").first}:00';
            _focusedDay = focusedDay;
          });
        }
      },
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDate, day);
      },
      sixWeekMonthsEnforced: false,
      startingDayOfWeek: StartingDayOfWeek.monday,
      daysOfWeekHeight: 18,
      daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(18, 65, 100, 1),
              fontWeight: FontWeight.normal),
          weekendStyle: TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(18, 65, 100, 1),
              fontWeight: FontWeight.normal)),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(18, 65, 100, 1),
            fontWeight: FontWeight.bold),
        formatButtonShowsNext: false,
        formatButtonDecoration: BoxDecoration(
          color: Color.fromRGBO(18, 65, 100, 1),
        ),
        formatButtonTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      calendarStyle: const CalendarStyle(
        isTodayHighlighted: false,
        defaultTextStyle: TextStyle(
          fontSize: 17,
          color: Color.fromRGBO(19, 68, 105, 1),
          fontWeight: FontWeight.bold,
        ),
        todayTextStyle: TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        selectedTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        selectedDecoration: BoxDecoration(
          color: Color.fromRGBO(19, 68, 105, 1),
          shape: BoxShape.circle,
        ),
        weekendTextStyle: TextStyle(
          color: Color.fromRGBO(19, 68, 105, 1),
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
    );
  }
}
