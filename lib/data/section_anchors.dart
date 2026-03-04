import 'package:flutter/material.dart';

enum HomeSection {
  inicio,
  quemsomos,
  especialidades,
  equipe,
  depoimentos,
  duvidas,
  contato
}

final sectionKeys = <HomeSection, GlobalKey>{
  HomeSection.inicio: GlobalKey(),
  HomeSection.quemsomos: GlobalKey(),
  HomeSection.especialidades: GlobalKey(),
  HomeSection.equipe: GlobalKey(),
  HomeSection.depoimentos: GlobalKey(),
  HomeSection.duvidas: GlobalKey(),
  HomeSection.contato: GlobalKey(),
};

String sectionLabel(HomeSection s) {
  switch (s) {
    case HomeSection.inicio:
      return 'Início';
    case HomeSection.quemsomos:
      return 'Quem Somos';
    case HomeSection.especialidades:
      return 'Especialidades';
    case HomeSection.equipe:
      return 'Equipe';
    case HomeSection.depoimentos:
      return 'Depoimentos';
    case HomeSection.duvidas:
      return 'Dúvidas';
    case HomeSection.contato:
      return 'Contato';
  }
}
