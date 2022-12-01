import 'package:responsive_framework/responsive_wrapper.dart';

final breakpoints = [
  const ResponsiveBreakpoint.autoScale(300, name: MOBILE),
  const ResponsiveBreakpoint.autoScaleDown(600, name: MOBILE),
  const ResponsiveBreakpoint.resize(900, name: TABLET),
  const ResponsiveBreakpoint.resize(1400, name: DESKTOP),
  const ResponsiveBreakpoint.resize(2450, name: '2k'),
  const ResponsiveBreakpoint.resize(3840, name: '4k'),

  const ResponsiveBreakpoint.tag(1200, name: 'CANDIDATE_CONTENT_MARGIN'),
  const ResponsiveBreakpoint.tag(1400, name: 'LOGIN_REGISTER_PAGE_SPLIT'),
  const ResponsiveBreakpoint.tag(1400, name: 'CANDIDATE_CONTENT_SPLIT_COVER_IMAGE'),
  const ResponsiveBreakpoint.tag(1000, name: 'CONTENT_MIN_WIDTH'),
];