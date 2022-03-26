import 'dart:ffi';

@TestOn('windows')
import 'package:ffi/ffi.dart';
import 'package:test/test.dart';
import 'package:win32/win32.dart';

void main() {
  if (isWindowsRuntimeAvailable()) {
    late ICalendar calendar;

    setUp(() {
      winrtInitialize();

      final object =
          CreateObject('Windows.Globalization.Calendar', IID_ICalendar);
      calendar = ICalendar(object);
    });

    test('Calendar year', () {
      expect(calendar.Year, greaterThanOrEqualTo(2021));
    });

    test('Calendar day', () {
      expect(calendar.Day, inInclusiveRange(1, 31));
    });

    test('Calendar day of week', () {
      expect(calendar.DayOfWeek, inInclusiveRange(0, 6));
    });

    test('Calendar hour', () {
      expect(calendar.Hour, inInclusiveRange(0, 23));
    });

    test('Calendar DST', () {
      expect(calendar.IsDaylightSavingTime, anything);
    });

    test('Calendar add years', () {
      calendar.AddYears(10);
      expect(calendar.Year, greaterThanOrEqualTo(2031));
    });

    test('Calendar subtract years', () {
      calendar.AddYears(-100);
      // This test will start failing in 2100 :)
      expect(calendar.Year, inInclusiveRange(1921, 2000));
      calendar.AddYears(-100);
      // This test will start failing in 2100 :)
      expect(calendar.Year, inInclusiveRange(1821, 1900));
      calendar.AddYears(-100);
      // This test will start failing in 2100 :)
      expect(calendar.Year, inInclusiveRange(1721, 1800));
    });

    test('Calendar month as string', () {
      // Repeat to ensure that this doesn't fail because of some kind of memory
      // issue.
      for (var i = 0; i < 10000; i++) {
        final month = calendar.MonthAsFullString();
        expect(
            month,
            isIn([
              'January',
              'February',
              'March',
              'April',
              'May',
              'June',
              'July',
              'August',
              'September',
              'October',
              'November',
              'December'
            ]));
      }
    });

    // test('Calendar month as truncated string', () {
    //   final month = calendar.MonthAsString(3);
    //   expect(
    //       month,
    //       isIn([
    //         'Jan',
    //         'Feb',
    //         'Mar',
    //         'Apr',
    //         'May',
    //         'Jun',
    //         'Jul',
    //         'Aug',
    //         'Sep',
    //         'Oct',
    //         'Nov',
    //         'Dec'
    //       ]));
    // });

    test('Calendar resolved language', () {
      final hstrPtr = calloc<HSTRING>()..value = calendar.ResolvedLanguage;
      final lang = hstrPtr.toDartString();

      // Should be something like en-US
      expect(lang[2], equals('-'));
      expect(lang.length, equals(5));
      free(hstrPtr);
    });

    tearDown(() {
      free(calendar.ptr);
      winrtUninitialize();
    });
  }
}
