class ReelVideo {
  final String reelUrl;
  final String thumbnailUrl;
  final String title;
  final String? description;

  const ReelVideo({
    required this.reelUrl,
    required this.thumbnailUrl,
    required this.title,
    this.description,
  });

  static final _reelPattern = RegExp(
    r'instagram\.com/(?:[\w.]+/)?(reel|reels|p)/([A-Za-z0-9_-]+)',
  );

  /// URL del iframe oficial de Instagram, o `null` si [reelUrl] no es válida.
  String? get embedUrl {
    final match = _reelPattern.firstMatch(reelUrl);
    if (match == null) return null;
    final kind = match.group(1) == 'p' ? 'p' : 'reel';
    return 'https://www.instagram.com/$kind/${match.group(2)}/embed/';
  }

  /// Identificador estable para saber cuál video está activo.
  String get id => _reelPattern.firstMatch(reelUrl)?.group(2) ?? reelUrl;
}
