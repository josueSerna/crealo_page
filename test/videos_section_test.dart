import 'package:breakify/breakify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:page_crealo/desing_system/molecules/video_card.dart';
import 'package:page_crealo/desing_system/organisms/videos_section.dart';
import 'package:page_crealo/widgets/instagram_reel_embed.dart';

Future<void> _pump(WidgetTester tester, Size size) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    const BreakifyScope(
      child: MaterialApp(
        home: Scaffold(body: SingleChildScrollView(child: VideosSection())),
      ),
    ),
  );
}

void main() {
  testWidgets('no hay reproductores al inicio', (tester) async {
    await _pump(tester, const Size(1400, 1000));
    expect(find.byType(InstagramReelEmbed), findsNothing);
  });

  testWidgets('solo un reproductor activo a la vez', (tester) async {
    await _pump(tester, const Size(1400, 1000));

    await tester.tap(find.byType(VideoCard).at(0));
    await tester.pump();
    expect(find.byType(InstagramReelEmbed), findsOneWidget);

    await tester.tap(find.byType(VideoCard).at(1));
    await tester.pump();
    expect(find.byType(InstagramReelEmbed), findsOneWidget);
    final cards = tester.widgetList<VideoCard>(find.byType(VideoCard)).toList();
    expect(cards.map((c) => c.isPlaying), [false, true, false, false]);
  });

  for (final (label, width, expected) in [
    ('lg', 1400.0, 4),
    ('md', 900.0, 2),
    ('sm', 400.0, 1),
  ]) {
    testWidgets('$expected columna(s) en $label', (tester) async {
      await _pump(tester, Size(width, 1000));
      final columns = tester
          .widgetList<VideoCard>(find.byType(VideoCard))
          .map((c) => tester.getTopLeft(find.byWidget(c)).dx)
          .toSet()
          .length;
      expect(columns, expected);
    });
  }
}
