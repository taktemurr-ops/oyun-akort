import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_akort/oyun_akort.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(akortConfig.title.length, 33);
    expect(akortConfig.tagline.length, 33);
    for (final s in akortConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(akortConfig.gameId, akortId);
    expect(akortRules.gameId, akortId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(akortRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: akortId, optionalMechanics: akortRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(akortRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
