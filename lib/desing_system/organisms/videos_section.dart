import 'package:breakify/breakify.dart';
import 'package:flutter/material.dart';
import 'package:page_crealo/data/reel_videos.dart';
import 'package:page_crealo/desing_system/atoms/app_section_title.dart';
import 'package:page_crealo/desing_system/molecules/video_card.dart';
import 'package:page_crealo/desing_system/tokens/app_colors.dart';

class VideosSection extends StatefulWidget {
  const VideosSection({super.key});

  @override
  State<VideosSection> createState() => _VideosSectionState();
}

class _VideosSectionState extends State<VideosSection> {
  // Un solo id activo garantiza un único reproductor montado a la vez.
  String? _playingId;

  @override
  Widget build(BuildContext context) {
    return BreakifySection(
      backgroundColor: AppColors.primary,
      fullViewport: true,
      child: SizedBox(
        width: double.infinity,
        child: BreakifyContainer(
          maxWidth: const BreakifyValue(sm: 1200.0),
          padding: const BreakifyValue(
            sm: EdgeInsets.symmetric(horizontal: 20, vertical: 56),
            lg: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppSectionTitle(
                title: 'Contenido Audiovisual',
                subtitle:
                    'Le damos forma a tus ideas a través del lente.\n'
                    '(Toca dos veces un video para verlo).',
                titleColor: AppColors.backgroundLight,
                subtitleColor: AppColors.backgroundLight,
              ),
              const SizedBox(height: 40),
              BreakifyGrid(
                columns: const BreakifyValue(sm: 2, md: 3, lg: 4),
                spacing: const BreakifyValue(sm: 12.0, md: 16.0, lg: 20.0),
                heightMode: BreakifyHeightMode.equal,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  for (final video in reelVideos)
                    VideoCard(
                      key: ValueKey(video.id),
                      video: video,
                      isPlaying: _playingId == video.id,
                      onPlay: () => setState(() => _playingId = video.id),
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
