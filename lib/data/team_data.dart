class TeamPerson {
  final String id;
  final String name;
  final String roleShort;
  final String roleFull;
  final String initials;
  final List<String> bullets;
  final String? photoAsset;
  final String? socialmediaLink;

  const TeamPerson({
    required this.id,
    required this.name,
    required this.roleShort,
    required this.roleFull,
    required this.initials,
    required this.bullets,
    this.photoAsset,
    this.socialmediaLink,
  });
}

String initialsFromName(String name) {
  final parts = name.trim().split(RegExp(r'\s+'));
  if (parts.isEmpty) return '';
  final first = parts.first.isNotEmpty ? parts.first[0] : '';
  final last = parts.length > 1 ? parts.last[0] : '';
  return (first + last).toUpperCase();
}

const teamData = <TeamPerson>[
  TeamPerson(
    id: 'pabline-cavalcante',
    name: 'Pabline Cavalcante',
    socialmediaLink: 'instagram.com/pabline.to',
    roleShort: 'Terapeuta Ocupacional',
    roleFull: 'Terapeuta Ocupacional • Crefito 11: 21300-TO',
    initials: 'PC',
    photoAsset: 'assets/images/team/pabline.jpg',
    bullets: [
      'Terapeuta Ocupacional – UNB (2019).',
      'Pós-graduanda em Desenvolvimento Infantil e Intervenção Precoce.',
      'Formação em psicomotricidade.',
      'Integração Sensorial de Ayres.',
      'Habilitada no Conceito Neuroevolutivo Bobath.',
      'Atuação com estimulação precoce e reabilitação pediátrica.',
      'Sócia fundadora do Portal do Desenvolvimento Infantil.',
    ],
  ),
  TeamPerson(
    id: 'roberta-bomfim',
    name: 'Roberta Bomfim',
    socialmediaLink: 'instagram.com/robertabomfim',
    roleShort: 'Fisioterapeuta',
    roleFull: 'Fisioterapeuta • CREFITO-11 61750-F',
    initials: 'RB',
    photoAsset: 'assets/images/team/roberta.jpg',
    bullets: [
      'Fisioterapeuta – Universidade Metodista de São Paulo (2003).',
      'Aprimoramento em Fisioterapia em Terapia Intensiva (HC/FMUSP).',
      'Mestre em Ciências da Saúde (UnB).',
      'Método RTA avançado.',
      'Escala Motora Infantil de Alberta.',
      'Método CME – nível II.',
      'Atuação no Centro de Referência Interdisciplinar em Síndrome de Down (SES/DF).',
    ],
  ),
  TeamPerson(
    id: 'caio-gomes',
    name: 'Caio Gomes',
    socialmediaLink: 'instagram.com/caiogl',
    roleShort: 'Terapeuta Ocupacional',
    roleFull: 'Terapeuta Ocupacional • CREFITO-11 23457',
    initials: 'CG',
    photoAsset: 'assets/images/team/caio.jpg',
    bullets: [
      'Terapeuta Ocupacional pela Universidade de Brasília.',
      'Certificado em integração sensorial (CLASI).',
      'Pós-graduado em terapia da mão e reabilitação do membro superior (FMUSP/IOT).',
      'Fundador e CEO Canguru TO e equipamentos.',
      'Curso: Recusa e seletividade alimentar na criança.',
      'Curso: Integrated Sensory Toileting.',
      'Mestrando no PPGCR UnB/FCE.',
    ],
  ),
  TeamPerson(
    id: 'juliana-garcia',
    name: 'Juliana Garcia',
    socialmediaLink: 'instagram.com/jjulianagarcia.nutri',
    roleShort: 'Nutricionista',
    roleFull: 'Nutricionista • CRN 6103',
    initials: 'JG',
    photoAsset: 'assets/images/team/juliana.png',
    bullets: [
      'Pós Graduada em Educação Alimentar e Nutricional.',
      'Habilitada em Alimentação Consciente e Intuitiva.',
      'Certificada em Comportamento Alimentar na Infância.',
      'Formada em Coach Nutricional Infantil pelo Método Atitude em Nutrição.',
      'Especializada em Alergias Alimentares com vasta experiência clínica na área e membro da ASBAI.',
      'Formação em Terapia Cognitivo Comportamental na Alimentação.',
      'Capacitada em Introdução Alimentar Participativa e Método BLW.',
      'Capacitada em Nutrição em Autismo com complementação em Dificuldades Alimentares.',
    ],
  ),
  TeamPerson(
    id: 'gabriela-rosa',
    name: 'Gabriela Rosa',
    socialmediaLink: 'instagram.com/gabi_rosab',
    roleShort: 'Fisioterapeuta',
    roleFull: 'Fisioterapeuta • CREFITO 11 356980-F',
    initials: 'GR',
    photoAsset: 'assets/images/team/gabriela.jpg',
    bullets: [
      'Fisioterapeuta – Universidade de Brasília (2022).',
      'Bandagem elástica.',
      'Método RTA básico.',
      'GEFIN – UnB.',
      'Experiência em UTI neonatal.',
      'Experiência em estimulação precoce e neurodesenvolvimento.',
    ],
  ),
  TeamPerson(
    id: 'flavia-porto',
    name: 'Flávia Porto',
    socialmediaLink: 'instagram.com/flaviaport0.psi',
    roleShort: 'Psicóloga',
    roleFull: 'Psicóloga • CRP 01/25973',
    initials: 'FP',
    photoAsset: 'assets/images/team/flavia.jpg',
    bullets: [
      'Psicóloga – UNIEURO (2021).',
      'Especialista em ABA.',
      'Modelo Denver.',
      'Psicomotricidade relacional.',
      'Experiência com público infantil e adolescente.',
    ],
  ),
  TeamPerson(
    id: 'marina-morelli',
    name: 'Marina Morelli',
    socialmediaLink: 'instagram.com/psi.marinamorelli',
    roleShort: 'Psicóloga',
    roleFull: 'Psicóloga Infantil e Adolescente • CRP 01/26216',
    initials: 'MM',
    photoAsset: 'assets/images/team/marina.jpg',
    bullets: [
      'Pós-graduanda em neuropsicologia.',
      'Terapia lúdica e responsiva.',
      'Pós Graduanda em Reabilitação Neurocognitiva.',
      'Terapia Lúdica e Responsiva.'
          'Especialização em seletividade alimentar.',
    ],
  ),
  TeamPerson(
    id: 'leticia-sebba',
    name: 'Letícia Sebba',
    socialmediaLink: 'instagram.com/let_sebba',
    roleShort: 'Terapeuta Ocupacional',
    roleFull: 'Terapeuta Ocupacional • CREFITO 11 26046-TO',
    initials: 'LS',
    photoAsset: 'assets/images/team/leticia.jpeg',
    bullets: [
      'Graduada em Psicomotricidade.',
      'Graduada em Análise do Comportamento Aplicada - ABA.',
      'Graduada em Nutrição aplicada ao Transtorno do Espectro Autista.',
      'Pós Graduanda em Neurociência.',
    ],
  ),
  TeamPerson(
    id: 'larissa-bessa',
    name: 'Larissa Bessa',
    socialmediaLink: 'instagram.com/larissabnutri',
    roleShort: 'Nutricionista',
    roleFull: 'Nutricionista - CRN 22279-1',
    initials: 'LB',
    photoAsset: 'assets/images/team/larissa.jpeg',
    bullets: [
      'Pós graduada em Nutrição Materno-Infantil.',
      'Atua com gestantes, bebês e crianças, com foco em introdução alimentar, seletividade alimentar e dificuldades no comer.',
      'Trabalha com abordagem acolhedora e baseada em evidências, utilizando estratégias de baixa pressão e respeitando o desenvolvimento infantil, especialmente em casos de TEA e outras condições do neurodesenvolvimento.',
    ],
  ),
];
