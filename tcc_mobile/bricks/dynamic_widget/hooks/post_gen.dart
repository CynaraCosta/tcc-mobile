import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final logger = context.logger;
  final progress = logger.progress('Executando o dart fix 🚀 🚀 🚀');
  try {
    final result = await Process.run(
      'bash',
      ['-c', 'dart fix --apply'],
    );
    progress.complete();
    logger.info(result.stdout);

    if (result.exitCode != 0) {
      logger.err(result.stderr);
    }

    logger.info(
      result.exitCode == 0
          ? 'Dart fix executado com sucesso 🎊 🎊 🎊'
          : 'Erro ao executar o dart fix 😥',
    );
    exit(result.exitCode);
  } catch (err) {
    logger.err('Ops, algo de errado não está certo 😥. Motivo: $err');
  }
}
